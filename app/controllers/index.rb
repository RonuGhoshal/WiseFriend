get '/' do
  erb :'index'
end

get '/login' do
  erb :'login'
end

get '/logout' do
  session = nil
  redirect '/'
end

post '/login' do
  if params[:user_type] == "mentee"
    @mentee = Mentee.find_by(email: params[:email])
    if @mentee
      # if Mentee.authenticate(@mentee.email, params[:password])
        session[:id] = @mentee.id
        session[:type] = "mentee"
        redirect "/mentees/#{@mentee.id}"
      # else
        # @errors = ["Invalid password."]
        # erb :'/login'
      # end
    else
      @errors = ["Invalid username."]
      erb :'/login'
    end
  elsif params[:user_type] == "mentor"
    @mentor = Mentor.find_by(email: params[:email])
    if @mentor
      # if Mentor.authenticate(@mentor.email, params[:password])
        session[:id] = @mentor.id
        session[:type] = "mentor"
        redirect "/mentors/#{@mentor.id}"
      # else
      #   @errors = ["Invalid password."]
      #   erb :'/login'
      # end
    else
      @errors = ["Invalid username."]
      erb :'/login'
    end
  end
end

