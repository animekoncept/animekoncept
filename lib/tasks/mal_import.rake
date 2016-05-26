desc "Fetch mal info"
task :fetch_mal_info => :environment do
  require "nokogiri"
  require "open-uri"
  require 'mechanize'

  Anime.all.each do |anime|
    agent = Mechanize.new
    url   = "http://myanimelist.net/anime/#{anime.mal_id}/#{CGI.escape(anime.slug)}"
    doc   = agent.get(url)



    cover_image = doc.at("td.borderClass a img")['src']
    english     = doc.css('div#content .borderClass .js-scrollfix-bottom .spaceit_pad:contains("English")').text.split(' ')[1..-1]
    japanese    = doc.css('div#content .borderClass .js-scrollfix-bottom .spaceit_pad:contains("Japanese")').text.split(' ')[1..-1]
    type_of     = doc.css('div#content .borderClass .js-scrollfix-bottom div:contains("Type")').text.split(' ')[1..-1]
    episodes    = doc.css('div#content .borderClass .js-scrollfix-bottom .spaceit:contains("Episodes")').text.split(' ')[1..-1]
    aired_on    = doc.css('div#content .borderClass .js-scrollfix-bottom .spaceit:contains("Aired")').text.split(' ')[1..3]
    ended_on    = doc.css('div#content .borderClass .js-scrollfix-bottom .spaceit:contains("Aired")').text.split(' ')[5..-1]
    duration    = doc.css('div#content .borderClass .js-scrollfix-bottom .spaceit:contains("Duration")').text.split(' ')[1..1]
    rating      = doc.css('div#content .borderClass .js-scrollfix-bottom div:contains("Rating")').text.split(' ')[1..-1]
    synopsis    = doc.css('span[itemprop="description"]').text

    puts synopsis

  if false
    if english.blank?
      puts "blank"
    else
      puts english.join(' ')
    end

    if japanese.blank?
      puts "blank"
    else
      puts japanese.join(' ')
    end

    if type_of.blank?
      puts "blank"
    else
      puts type_of.join(' ')
    end

    if episodes.blank?
      puts "blank"
    else
      puts episodes.join(' ')
    end

    if ended_on.blank?
      puts = "none"
    else
      puts ended_on.join(' ')
    end

    if aired_on.blank?
      puts = "none"
    else
      puts aired_on.join(' ')
    end

    if duration.blank?
      duration = "none"
    else
      puts duration.join(' ')
    end

    if rating.blank?
      rating = "none"
    else
      puts rating.join(' ')
    end
  end

    #anime.update_attribute(:cover_image, cover_image)
  end
end
