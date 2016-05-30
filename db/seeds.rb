
['user', 'banned', 'moderator', 'admin'].each do |role|
  Role.find_or_create_by({title: role})
end

Category.create(title: 'site news')
Category.create(title: 'industry news')
Category.create(title: 'general')
Category.create(title: 'anime')
Category.create(title: 'manga')
Category.create(title: 'visual novels')
Category.create(title: 'feedback')
Category.create(title: 'events')
Category.create(title: 'gaming')
Category.create(title: 'music')
Category.create(title: 'recommendation')
Category.create(title: 'dev')
Category.create(title: 'creations')


['action', 'adventure', 'cars', 'comedy', 'dementia', 'demons', 'drama',
  'ecchi', 'fantasy', 'game', 'harem', 'hentai', 'historical', 'horror',
  'josei', 'kids', 'magic', 'martial arts', 'mecha', 'military', 'music',
  'mystery', 'parody', 'police', 'phychological', 'romance', 'samurai',
  'school', 'sci-fi', 'seinen', 'shoujo', 'shoujo ai', 'shounen',
  'shounen ai', 'slice of life', 'space', 'sports', 'super power',
  'supernatural', 'thriller', 'vampire', 'yaoi', 'yuri'].each do |genre|
    Genre.find_or_create_by({title: genre})
  end
