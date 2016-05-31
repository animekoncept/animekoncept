namespace :import do
  desc "Importing season from csv"
  task seasons: :environment do
    filename = File.join Rails.root, "seasons.csv"
    counter = 0
    CSV.foreach(filename) do |row|
      title = row
      season = Season.create(title: title,)
      puts "#{season} - #{season.errors.full_messages.join(",")}" if season.errors.any?
      counter += 1 if season.persisted?
    end
    puts "Imported #{counter} seasons"
  end
end
