desc "Fetch mal info"
task :fetch_mal_info => :environment do
  require "nokogiri"
  require "open-uri"
  require 'mechanize'
  require 'chronic'



  english = []
  japanese = []
  type_of = []
  episodes = []
  #aired_on = []
  #ended_on = []
  duration = []
  rating = []
  synopsis = []
  genre = []
  Anime.all.each do |anime|
    agent = Mechanize.new
    url   = "http://myanimelist.net/anime/#{anime.mal_id}/#{CGI.escape(anime.slug)}"
    doc   = agent.get(url)



    cover_image_scrape = doc.at("td.borderClass a img")
    english_scrape     = doc.css('div#content .borderClass .js-scrollfix-bottom .spaceit_pad:contains("English")').text.split(' ')[1..-1]
    japanese_scrape    = doc.css('div#content .borderClass .js-scrollfix-bottom .spaceit_pad:contains("Japanese")').text.split(' ')[1..-1]
    type_of_scrape     = doc.css('div#content .borderClass .js-scrollfix-bottom div:contains("Type")').text.split(' ')[1..-1]
    episodes_scrape    = doc.css('div#content .borderClass .js-scrollfix-bottom .spaceit:contains("Episodes")').text.split(' ')[1..-1]
    aired_on_scrape    = doc.css('div#content .borderClass .js-scrollfix-bottom .spaceit:contains("Aired")').text.split(' ')[1..3].join(' ')
    ended_on_scrape    = doc.css('div#content .borderClass .js-scrollfix-bottom .spaceit:contains("Aired")').text.split(' ')[5..-1]
    duration_scrape    = doc.css('div#content .borderClass .js-scrollfix-bottom .spaceit:contains("Duration")').text.split(' ')[1..1]
    rating_scrape      = doc.css('div#content .borderClass .js-scrollfix-bottom div:contains("Rating")').text.split(' ')[1..-1]
    synopsis           = doc.css('span[itemprop="description"]').text
    season_scrape      = doc.css('div#content .borderClass .js-scrollfix-bottom div:contains("Premiered")').text.split(' ')[1..-1]
    season_text        = season_scrape.blank? ? "" : season_scrape.join(' ')
    genre_scrape       = doc.css('div#content .borderClass .js-scrollfix-bottom div:contains("Genres")').text.split(' ')[1..-1]


    if cover_image_scrape.blank?
      cover_image = nil
    else
      cover_image = cover_image_scrape['src']
    end

    if english_scrape.blank?
      english = ""
    else
      english = english_scrape.join(' ')
    end

    if japanese_scrape.blank?
      japanese =  ""
    else
      japanese = japanese_scrape.join(' ')
    end

    if type_of_scrape.blank?
      type_of =  ""
    else
      type_of = type_of_scrape.join(' ')
    end

    if episodes_scrape.blank?
      episodes = ""
    else
      episodes = episodes_scrape.join(' ')
    end

    aired_date = Chronic.parse(aired_on_scrape)
    aired_on = aired_date

    if ended_on_scrape.blank?
      ended_on = nil
    else
      date = ended_on_scrape.join(' ')
      ended_date = Chronic.parse(date)
      ended_on = ended_date
    end

    if rating_scrape.blank?
      rating = ""
    else
      rating = rating_scrape.join(' ')
    end

    if duration_scrape.blank?
      duration = ""
    else
      duration = duration_scrape.join(' ')
    end



    if genre_scrape.blank?
      genre = ""
    else
      genre = genre_scrape.join(' ')
    end


    #anime.update_attribute(:cover_image, cover_image)
    #anime.update_attribute(:english,     english)
    #anime.update_attribute(:japanese,   japanese)
    #anime.update_attribute(:type_of,     type_of)
    #anime.update_attribute(:episodes,    episodes)
    #anime.update_attribute(:aired_on,    aired_on)
    #anime.update_attribute(:ended_on,    ended_on)
    #anime.update_attribute(:duration,    duration)
    #anime.update_attribute(:rating,      rating)
    #anime.update_attribute(:synopsis,    synopsis)
    season = Season.where(title: season_text).first_or_create
    anime.update(season: season)
  end
end
