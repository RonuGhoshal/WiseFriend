get '/' do
  @original_tweets = TWITTER_CLIENT.search("ex-offender", result_type: "recent").take(50)
  tweet_hash = {}
  @original_tweets.each do |tweet|
    tweet_hash[tweet.text] ||= tweet
  end
  @tweets = []
  tweet_hash.each do |k, v|
    @tweets.push(v)
  end
  erb :'index'
end

get '/login' do
  erb :'login'
end

post '/login' do
  if params[:user_type] == "Mentee"
    @mentee = Mentee.find_by(email: params[email])
    if @mentee
      if Mentee.authenticate(@mentee.email, params[:password])
        session[:id] = @mentee.id
        @session[:type] = "Mentee"
        redirect "/mentees/#{@mentee.id}"
      else
        @errors = ["Invalid password."]
        erb :'/login'
      end
    else
      @errors = ["Invalid username."]
      erb :'/login'
    end
  elsif params[:user_type] == "Mentor"
    if @mentor
      if Mentor.authenticate(@mentor.email, params[:password])
        session[:id] = @mentor.id
        @session[:type] = "Mentor"
        redirect "/mentors/#{@mentor.id}"
      else
        @errors = ["Invalid password."]
        erb :'/login'
      end
    else
      @errors = ["Invalid username."]
      erb :'/login'
    end
  end
end
