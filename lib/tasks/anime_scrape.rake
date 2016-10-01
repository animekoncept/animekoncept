desc "Fetch anime"
task :fetch_anime => :environment do
   require "open-uri"
   require 'mechanize'
   require "csv"

   agent = Mechanize.new

   max_number = (1..100)
   max_page = max_number.max.to_i

   title = []
   mal_id = []


   if true #testing purposes
     begin
        max_page.times do |i|

           url = "https://myanimelist.net/anime/genre/1?page=#{i+1}"
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

           CSV.open("anime_script.csv", "a+") do |file|
              file << ["title", "mal_id"]
              title.length.times do |i|
                 file << [title[i], mal_id[i]]
              end
           end
        end
     rescue
       puts "Finish"
     end
  end
end#end of task
