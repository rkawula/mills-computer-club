class Post < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image
  attr_accessible :slug, :contents, :title, :user_id, :image, :published
  validates_attachment :image, content_type: { content_type:
                        ['image/jpg', 'image/jpeg', 'image/png', 'image/gif'] }

  def created_date_readable
    created_at.to_formatted_s(:long_ordinal)
  end

  def create_slug
    slug_from_date + '-' + slug_from_title
  end

  def to_param
    slug
  end

  private

  def slug_from_title
    title.downcase.tr(' ', '-').gsub(/[^\w-]/, '').gsub(/\A-/, '')
  end

  def slug_from_date
    created_at.strftime '%Y-%m-%d'
  end
end
