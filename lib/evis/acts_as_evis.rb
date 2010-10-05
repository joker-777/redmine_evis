
module Evis

  SERVER = 'api.eviscape.com'
  NOD_ID = 306

  def self.included(base)
    base.class_eval do
      extend ClassMethods
      class << self
        alias_method_chain :find, :evis
      end
    end
  end

  module ClassMethods
    def find_with_evis(*args)
      api_query = Evis.generate_api_query args
      response = Net::HTTP.get SERVER, api_query
      Evis.convert_to_news_objects response
    end
  end

  def self.convert_to_news_objects request_result
    # request result contains '(' and ')' at the beginning and enf of the string which have to be removed 
    # otherwise the result is not recognizes as a json string
    request_result = request_result[1...request_result.length-1]
    hash = ActiveSupport::JSON.decode request_result
    news = []
    #author = User.find_by_username('admin') 
    hash["objects"].each do |object|
      evis = object["evis"]
      news_object = News.new
      news_object.id = evis["evi_id"]
      news_object.title = evis["evi_subject"]
      news_object.description = evis["evi_body"]
      news_object.author_id = 1
      news_object.project_id = 1 
      news_object.comments_count = evis["evi_comment_count"]
      news_object.created_on = evis["evi_insert_date"]
      news << news_object
    end
    news
  end

  def self.generate_api_query args
    api_query = ''
    api_query = "/api/1.0/rest/?method=evis.sent&format=json&jsoncallback=?"#if args.include? :all
    api_query << "&nod_id=#{NOD_ID}"
  end

end

News.send :include, Evis
