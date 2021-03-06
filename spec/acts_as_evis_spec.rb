require File.dirname(__FILE__) + '/spec_helper'

SERVER = "api.eviscape.com"
NOD_ID = 306

describe "News as Evis" do

  fixtures :news

  def compare_results array1, array2
    array1.sort! {|x,y| y.id.to_i <=> x.id.to_i }
    array2.sort! {|x,y| y.id.to_i <=> x.id.to_i  }
    array1.to_json.should == array2.to_json
  end

  before(:each) do
    
    @evis_api_result = "({\"stat\": \"ok\", \"perpage\": 1000, \"pages\": 1, \"objects\": [{\"evis\": {\"nod_name\": \"David-Redfern-News\", \"evi_id\": 11306, \"evi_insert_date\": \"2010-07-02 20:14:21\", \"mem_id\": 4, \"evi_permalink\": \"test-nhrgzjcn\", \"evi_comment_count\": 2, \"mem_name\": \"simonredfern\", \"typ_value\": \"event\", \"nod_logo_image\": \"\", \"evi_subject\": \"No Tour Dates Yet\", \"evi_body\": \"\\n        <p>Watch this space..</p>\\n        \", \"nod_id\": 306}, \"ref\": \"http://eviscape.com/evis/test-nhrgzjcn/\", \"id\": 11306}, {\"evis\": {\"nod_name\": \"David-Redfern-News\", \"evi_id\": 11209, \"evi_insert_date\": \"2010-04-29 19:17:27\", \"mem_id\": 4, \"evi_permalink\": \"may-2010-sfgzshfk\", \"evi_comment_count\": 0, \"mem_name\": \"simonredfern\", \"typ_value\": \"news\", \"nod_logo_image\": \"\", \"evi_subject\": \"May 2010\", \"evi_body\": \"\\n        Greetings from a very hot and sultry\\nNew Orleans. The music is much like the weather - ever present: it's\\na wonderful vibe!\\n<p style=\\\"margin-bottom: 0in;\\\">I'm here to photograph the New Orleans\\nJazz & Heritage Festival, and this being my 34th\\nfestival, I'm very familiar with the Crescent City, in fact I've\\nspent well over a year of my life here, and it doesn't feel a day too\\nlong.</p>\\n<p style=\\\"margin-bottom: 0in;\\\">I can say that even after all this time\\nit's just as exciting! With such artists as Simon & Garfunkel,\\nAnita Baker, Lionel Richie, Joe Lavano, Terence Blanchard to name but\\na few. And to come this weekend we have Aretha Franklin, Jeff Beck,\\nElvis Costello, Dee Dee Bridgewater to capture just a few headliners\\nfrom the some 400 plus bands appearing over the whole festival.</p>\\n<p style=\\\"margin-bottom: 0in;\\\">Best of the fest so far was the 'Voice\\nof the Wetlands All Stars' featuring Tab Benoit, Anders Osbourne,\\nCyril Neville, Dr John & George Porter Jnr, - that really was\\ncooking! The one to watch for me is trumpeter Shamarr Allen whom I\\nsaw playing with Terrance Simien's Zydeco Experience last weekend,\\nbut is with his own band The Underdawgs this Saturday.</p>\\n<p style=\\\"margin-bottom: 0in;\\\">Blues man Luther Kent with his big band\\nTrick Bag, takes no prisoners in the small intimate Monkey Hill bar\\non trendy Magazine Street, a perfect end to the two festival\\nSaturdays. They play until the wee small hours, and give a lasting\\nmemory of sight and sounds that goes on forever!</p>\\n<p style=\\\"margin-bottom: 0in;\\\">\\u00a0</p>\\n        \", \"nod_id\": 306}, \"ref\": \"http://eviscape.com/evis/may-2010-sfgzshfk/\", \"id\": 11209}, {\"evis\": {\"nod_name\": \"David-Redfern-News\", \"evi_id\": 10907, \"evi_insert_date\": \"2009-12-31 15:28:09\", \"mem_id\": 66, \"evi_permalink\": \"news-january-2010-rrxchtxe\", \"evi_comment_count\": 0, \"mem_name\": \"davidredfern\", \"typ_value\": \"news\", \"nod_logo_image\": \"\", \"evi_subject\": \"January 2010\", \"evi_body\": \"\\n        Another decade gone\\u2026. Where did the time go?\\n<p>The year kicks off with still another 10 days to see my\\nexhibition at the Royal Albert Hall if your going to a concert, if not, there\\nare two free open days, Saturday January 9<sup>th:</sup> 10am \\u2013 1pm & Sunday\\nJanuary 10<sup>th</sup>: 10am \\u2013 1pm, Enter through door 1.</p>\\n<p>I will personally be there on the Sunday.</p>\\n<p>Our boutique & gallery is now open at 7 Bramley Road\\n(re-opening Jan 12<sup>th</sup> after the holidays) Tuesday \\u2013 Saturday 12\\nmidday \\u2013 6pm, where you can see & purchase Suzy Reed\\u2019s creations along with\\na selection of my pictures.</p>\\n<p>Apart from covering the usual festivals, my major project\\nfor 2010 will be to prepare an hour long picture show entitled \\u2018The Unclosed\\nEye\\u2019 which I hope to have ready by the spring.</p>\\n<p>Wherever you are have fun in 2010! I know I\\u2019m going too.</p>\\n<p>David Redfern\\u00a031-12-2009</p>\\n        \", \"nod_id\": 306}, \"ref\": \"http://eviscape.com/evis/news-january-2010-rrxchtxe/\", \"id\": 10907}, {\"evis\": {\"nod_name\": \"David-Redfern-News\", \"evi_id\": 10820, \"evi_insert_date\": \"2009-10-18 12:26:10\", \"mem_id\": 66, \"evi_permalink\": \"albert-hall-exhibition-nmpedrek\", \"evi_comment_count\": 0, \"mem_name\": \"davidredfern\", \"typ_value\": \"news\", \"nod_logo_image\": \"\", \"evi_subject\": \"September 2009\", \"evi_body\": \"\\n        Some 9 months have passed since I sold Redferns to Getty Images; the most frequently asked question (by far) 'I suppose you're just taking it easy now?'<br /><br />Nothing could be further from the truth! I\\u2019d never wanted to retire, if you have a passion for photography and it's lifestyle, then there is no cut off date. Much time has been spent renovating my building in West London, upgrading my flat and most importantly preparing the ground floor for our showroom that my partner Suzy & I are opening at the end of October.<br /><br />Yes, I have sold all my pictures (was the only way I could get a deal), but most importantly I have the use in perpetuity of my favourite 1000 images to market as fine art prints, and for my partner Suzy to use in her fashion textile business <a href=\\\"http://www.suzyreed.com\\\" target=\\\"_blank\\\">Suzy Reed Ltd</a>.<br /><br />The festival season started extremely well for me as usual with my 33rd attendance at the New Orleans Jazz & Heritage Festival, my first time as a 'Getty photographer' a challenge I relish, did a session with Vasti Jackson as a model for some generic Jazz & Blues pictures, it was first time that I'd really put my new Nikon D300 to the ultimate low light test; street scenes at night with no flash, I think it passed with flying colours! The French festivals, Vienne, Juan & Nice followed in that order, this enabled me to add some 80 artists to my new contemporary collection.<br /><br />I've just sold 11 giant images to be permanently placed in the newly refurbished Elgar room at the Royal Albert Hall, and they are giving me an exhibition in the amphi corridor at the end of the year. Talking of exhibitions, October the 9th see's the opening of \\\"The Spirit of Jazz\\\" at the Getty Images Gallery, Eastcastle Street central London, this is in association with Ronnie Scott's 50th Anniversary and features 11 of my pictures. I also have two pictures in the National Portrait Gallery exhibition 'Beatles to Bowie: the 60s exposed' (Oct 15th - 24th Jan 2010)<br /><br />Buy for now! Preferably some of my pictures.<br /><br />David Redfern\\n        \", \"nod_id\": 306}, \"ref\": \"http://eviscape.com/evis/albert-hall-exhibition-nmpedrek/\", \"id\": 10820}], \"total\": 4, \"page\": 1})"  

    @evis_news = News.find_without_evis :all
  end

  it 'should convert request result to News objects' do
    news = Evis.convert_to_news_objects @evis_api_result 
    compare_results news, @evis_news
  end

  it "should request Evis" do
    stub_request(:get, "#{SERVER}/api/1.0/rest/?method=evis.sent&format=json&jsoncallback=?&nod_id=#{NOD_ID}").to_return(:body => @evis_api_result)
    compare_results News.all, @evis_news
  end

  describe 'generates api query' do
    
    it 'should get :all and returns "/api/1.0/rest/?method=evis.sent&format=json&jsoncallback=?&nod_id=" ' do
      api_query = Evis.generate_api_query [:all]
      api_query.should == "/api/1.0/rest/?method=evis.sent&format=json&jsoncallback=?&nod_id=#{NOD_ID}"
    end

  end

end
