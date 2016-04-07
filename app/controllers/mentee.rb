get '/mentees/new' do
  erb :'/mentees/new'
end

post '/mentees' do
  @mentee = Mentee.new(params[:mentee])
  if @mentee.save
    erb :'/mentees/show'
  end
end

get '/mentees/:id' do
  @mentee = Mentee.find(params[:id])
  erb :'/mentees/show'
end

post '/mentees/:id/mentorships' do
  @mentee = Mentee.find(params[:id])
  @mentor = Mentor.find(session[:id])
  Mentorship.new(mentee_id: @mentee.id, mentor_id: @mentee.id)
end
