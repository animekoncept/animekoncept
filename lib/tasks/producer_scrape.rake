desc "Fetch producers"
task :fetch_producers => :environment do

  require "open-uri"
  require 'mechanize'
  require "csv"

  agent = Mechanize.new
  url = "http://myanimelist.net/anime/producer"

  page = agent.get(url)


  t = []

  page.css('div#content .anime-manga-search .genre-name-link').each do |line|
    string = line.text.dup
    while string.gsub!(/\([^()]*\)/,""); end
    t << string
  end

  title = t

  CSV.open("producer_script.csv", "w") do |file|
     title.length.times do |i|
        file << [title[i]]
      end
  end

end
