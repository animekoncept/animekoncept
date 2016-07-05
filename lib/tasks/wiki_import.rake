desc "Fetch wiki info"
task :fetch_wiki_info => :environment do
  require 'wikipedia'
  Anime.all.each do |anime|
    a = anime.english
    if a.blank?
      page = ""
    else
      wiki = Wikipedia.find(a)
      page = wiki.fullurl
    end
    anime.update_attribute(:wiki, page)
  end
end
