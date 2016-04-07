get '/mentees/new' do
  erb :'/mentees/new'
end

post '/mentees' do
  @mentee = Mentee.new(params[:mentee])
  if @mentee.save
    erb :'/index'
  end
end
