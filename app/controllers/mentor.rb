get '/mentors/new' do
  erb :'/mentors/new'
end

post '/mentors' do
  @mentor = Mentor.new(params[:mentor])
  if @mentor.save
    session[:id] = @mentor.id
    session[:type] = "mentor"
    params[:expertise].each do |area|
      @mentor.areas.create(area_type: area)
    end
  end
  erb :"/mentors/show"
end

get '/mentors/:id' do
  @mentor = Mentor.find(params[:id])
  erb :'/mentors/show'
end


