
['user', 'banned', 'moderator', 'admin'].each do |role|
  Role.find_or_create_by({name: role})
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
