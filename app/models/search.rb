class Search < ActiveRecord::Base

  belongs_to :user
  has_many :results
  validates_presence_of :user_id
  after_save :save_results

  RESULTS_AMOUNT = 20
  SEARCH_TERM = :tomato

  def get
    set_search_term
    @client = TwitterClient.instance.get
    @results = @client.search(self.text, result_type: "recent").take(RESULTS_AMOUNT)
  end

  def get_results
    @results || []
  end


  private

  def set_search_term
    self.text ||= SEARCH_TERM
  end

  def save_results
    @results.each do |result|
      Result.create(search_id: self.id,
                    screen_name: result.user.screen_name,
                    text: result.text,
                    profile_image_url: result.user.profile_image_url.to_s,
                    tweet_published: result.created_at)
    end
  end

end
