get '/' do
  erb :'index'
end

get '/login' do
  erb :'login'
end

post '/login' do
  if params[:user_type] == "Mentee"
    @mentee = Mentee.find_by(email: params[email])
    session[:id] = @mentee.id
    @session[:type] = "Mentee"
    redirect "/mentees/#{@mentee.id}"
  elsif params[:user_type] == "Mentor"
    @mentor = Mentor.find_by(email: params[email])
    session[:id] = @mentor.id
    @session[:type] = "Mentor"
    redirect "/mentors/#{@mentor.id}"
  end
end
