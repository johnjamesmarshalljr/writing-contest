class SubmissionsController < ApplicationController
  # routes consist of
  # HTTP Verb - URL - Block
  get '/submissions' do # index route
    # binding.pry
    redirect '/' if !(is_logged_in?)

    # a list of rooms from the table
    @all_rooms = Submissions.all # <~ connect 2 table via MODEL
    # binding.pry
    erb :'submissions/index' # render the index view
  end

  get '/submissions/new' do # display form to create a new submission obj
    # binding.pry
    erb :'submissions/new'
  end

  post '/submissions' do # create a new sub obj based on form (user) input
  # option 3
    @new_submission = Submission.new(params)

    @new_submission.save

    redirect "/submissions/#{@new_submission.id}"
  end

  get '/submissions/:id' do # SHOW route
    redirect '/' if !(is_logged_in?)

    # display ONE room obj
    # binding.pry
    @submission_obj = Submission.find_by(id: params[:id])
    # @room_obj = Room.find( params[:id])
    if @submission_obj
      erb :'submissions/show.html'
    else
      redirect '/submissions'
    end
  end

  get '/rooms/:id/edit' do # EDIT route
    # display form to edit room obj form
    @room_obj = Room.find_by(id: params[:id])

    erb :'rooms/edit'
  end

  patch '/rooms/:id' do # update data in table w/user input
    # binding.pry
    # option 1
    # @room_obj = Room.find_by(id: params[:id])
    # @room_obj.theme = params[:theme]
    # @room_obj.name = params[:name]
    # @room_obj.use = params[:use] ? true : false
    # @room_obj.save

    @room_obj = Room.find_by(id: params[:id])

    @room_obj.update(
      theme: params[:theme],
      name: params[:name],
      use: params[:use]
    )

    redirect '/rooms'
  end

  delete '/rooms/:id' do #delete obj from table
    @room_obj = Room.find_by(id: params[:id])
    @room_obj.delete # | @room.obj.destory
    redirect '/rooms'
  end
end
