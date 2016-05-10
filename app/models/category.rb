class Category < ActiveRecord::Base
  has_many :topics
  acts_as_punchable

  extend FriendlyId
  friendly_id :title, use: :slugged

  def label_class
    label_class_map[title]
  end

  has_attached_file :header_image, styles: { large: "1920x600#", medium: "1920x850#" }
  validates_attachment_content_type :header_image, content_type: /\Aimage\/.*\Z/

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
