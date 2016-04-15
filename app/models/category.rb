class Category < ActiveRecord::Base
  has_many :topics
  acts_as_punchable

  def label_class
    label_class_map[title]
  end

  private
    def label_class_map
      {
        'site news' => 'site_news',
        'industry news' => 'industry_news',
        'general' => 'general',
        'anime' => 'anime_',
        'manga' => 'manga_',
        'visual novels' => 'visual_novels',
        'feedback' => 'feedback',
        'events' => 'events_',
        'gaming' => 'gaming',
        'music' => 'music',
        'recommendation' => 'recommendation',
        'dev' => 'dev',
        'creations' => 'creations',
      }
    end
end
