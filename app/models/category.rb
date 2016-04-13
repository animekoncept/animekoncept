class Category < ActiveRecord::Base
  has_many :topics

  def label_class
    label_class_map[title]
  end

  private
    def label_class_map
      {
        'site news' => 'alert',
        'industry news' => 'industry_news',
        'general' => 'general',
        'anime' => 'anime',
        'manga' => 'manga',
        'visual novels' => 'visual_novels',
        'feedback' => 'feedback',
        'events' => 'events',
        'gaming' => 'gaming',
        'music' => 'music',
        'recommendation' => 'recommendation',
        'dev' => 'dev',
        'creations' => 'creations',
      }
    end
end
