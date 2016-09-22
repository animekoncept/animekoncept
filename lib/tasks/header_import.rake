desc "Fetch header image"
task :fetch_header_image => :environment do
  require "nokogiri"
  require "open-uri"
  require 'mechanize'

  Anime.all.each do |anime|
    agent = Mechanize.new
    url = "https://wall.alphacoders.com/search.php?search=#{CGI.escape(anime.slug)}"
    doc = agent.get(url)


    link = doc.link_with(:href => /big/).click
    if link.blank?
      src = nil
    else
      src = link.at('img.img-responsive')['src']
    end

    if src = nil
      #do nothing
    else
      anime.update_attribute(:header_image, src)
    end
  end
end
