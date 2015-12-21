class Result < ActiveRecord::Base

  belongs_to :search
  validates_presence_of :search_id, :screen_name, :text, :profile_image_url, :tweet_published
  before_save :sanitize_fields


  private

  def sanitize_fields
    # fields_to_sanitize.each { |field| self[field] = sanitize_sql(self[field]) }
  end

  def sanitize_sql(str)
    ActiveRecord::Base::sanitize(str)
  end

  def fields_to_sanitize
    [:text, :screen_name]
  end

end
