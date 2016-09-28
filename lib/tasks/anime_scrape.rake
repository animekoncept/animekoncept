desc "Fetch anime"
task :fetch_anime => :environment do
   require "open-uri"
   require 'mechanize'
   require "csv"

   agent = Mechanize.new
   url = "http://myanimelist.net/anime/genre/1/Action"

   page = agent.get(url)
   #action = 29
   #adventure = 24
   #Comedy = 46

   title = []
   mal_id = []
   page_numbers = []

   (1..29).each do |line|
      page_numbers << line
   end
   max_page = page_numbers.max


   max_page.times do |i|

      url = "https://myanimelist.net/anime/genre/4/Action#{i+1}"
      page = agent.get(url)


      #title
      page.css('a.link-title').each do |line|
         title << line.text
      end

      page.css('a.link-title').each do |line|
         d = line['href']
         url = d.split('/', 5)[4]
         mal_id << url.to_i
      end

      CSV.open("anime_script.csv", "w") do |file|
         #file << ["title", "mal_id"]
         title.length.times do |i|
            file << [title[i], mal_id[i]]
         end
      end

   end
end
