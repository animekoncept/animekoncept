namespace :import do
  desc "Importing producers from csv"
  task producers: :environment do
    filename = File.join Rails.root, "producer_script.csv"
    counter = 0
    CSV.foreach(filename, headers: true) do |row|
      title = row
      producer = Producer.create(title: title)
      puts "#{producer} - #{producer.errors.full_messages.join(",")}" if producer.errors.any?
      counter += 1 if producer.persisted?
    end
    puts "Imported #{counter} producers"
  end
end
