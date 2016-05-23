namespace :import do
  desc "Importing anime from csv"
  task animes: :environment do
    filename = File.join Rails.root, "anime_script.csv"
    counter = 0
    CSV.foreach(filename) do |row|
      name, synopsis, aired_on, type_of, mal_id = row
      anime = Anime.create(name: name, synopsis: synopsis, aired_on: aired_on, type_of: type_of, mal_id: mal_id,)
      puts "#{anime} - #{anime.errors.full_messages.join(",")}" if anime.errors.any?
      counter += 1 if anime.persisted?
    end
    puts "Imported #{counter} animes"
  end
end
