desc "Fetch daisuki info"
task :fetch_daisuki_info => :environment do
  require "open-uri"
  require 'mechanize'


  Anime.all.each do |anime|
    agent = Mechanize.new
    english = anime.english.parameterize
    url   = "http://www.daisuki.net/us/en/anime.html"
    #page   = agent.get(url)

    agent.get('http://www.daisuki.net/us/en/anime.html') do |page|
      search_result = page.forms.first do |search|
        search.q = anime.english
      end.submit

      results = search_result.css('.item_pht a')

      daisuki_link = results.map { |link| link['href'] }.first

      puts daisuki_link

      #if daisuki_link.blank?

      #else
      #  daisuki = "http://www.crunchyroll.com#{crunchyroll_link}"
      #end

      #anime.update_attribute(:crunchyroll, crunchyroll)
    end
  end

end
