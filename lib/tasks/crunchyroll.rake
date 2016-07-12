desc "Fetch crunchyroll info"
task :fetch_crunchyroll_info => :environment do
  require "open-uri"
  require 'mechanize'


  Anime.all.each do |anime|
    agent = Mechanize.new
    english = anime.english.parameterize
    url   = "http://www.crunchyroll.com"
    #page   = agent.get(url)

    agent.get('http://www.crunchyroll.com/') do |page|
      search_result = page.form_with(:id => "header_search_form") do |search|
        search.q = anime.english
      end.submit

      results = search_result.css('.search-section #main_results li a')

      crunchyroll_link = results.map { |link| link['href'] }.first

      if crunchyroll_link.blank?
        
      else
        crunchyroll = "http://www.crunchyroll.com#{crunchyroll_link}"
      end

      anime.update_attribute(:crunchyroll, crunchyroll)
    end
  end

end
