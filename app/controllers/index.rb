get '/' do
  @tweets = TWITTER_CLIENT.search("from:DefyVentures", result_type: "recent").take(20).collect do |tweet|
    "#{tweet.user.screen_name}: #{tweet.text}"
  end
  erb :'index'
end


