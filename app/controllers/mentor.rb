get '/mentors/new' do
  erb :'/mentors/new'
end

post '/mentors' do
  @mentor = Mentor.new(params[:mentor])
  if @mentor.save
    params[:expertise].each do |area|
      @mentor.areas.create(area_type: area)
    end
  end
  erb :"/mentors/show"
end
