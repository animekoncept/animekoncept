desc "Fetch header image"
task :fetch_header_image => :environment do
  require "nokogiri"
  require "open-uri"
  require 'mechanize'

  Anime.all.each do |anime|
    agent = Mechanize.new
    url = "https://wall.alphacoders.com/search.php?search=#{CGI.escape(anime.slug)}"
    doc = agent.get(url)

    #header_image = doc.css("div.thumb-container-big img").first
    #image = header_image["src"]
    #link = doc.css( ".boxgrid a").first

    link = doc.link_with(:href => /big/).click
    src  = link.at('img#main_wallpaper')['src']
    #header_image = image.css("img#main_wallpaper")
    anime.update_attribute(:header_image, src)
    #puts m
  end
end
