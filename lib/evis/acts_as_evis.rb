
module Evis
  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods
    def acts_as_evis
    end
  end

  def self.convert_to_news_objects request_result
    # request result contains '(' and ')' at the beginning and enf of the string which have to be removed 
    # otherwise the result is not recognizes as a json string
    request_result = request_result[1...request_result.length-1]
    hash = ActiveSupport::JSON.decode request_result
    news = []
    hash["objects"].each do |object|
      evis = object["evis"]
      news_object = News.new
      news_object.id = evis["evi_id"]
      news_object.title = evis["evi_subject"]
      news_object.description = evis["evi_body"]
      news_object.author_id = 0
      news_object.comments_count = evis["evi_comment_count"]
      news_object.created_on = evis["evi_insert_date"]
      news << news_object
    end
    news
  end

end

ActiveRecord::Base.send :include, Evis
