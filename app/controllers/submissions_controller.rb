class SubmissionsController < ApplicationController

  get '/submissions' do # index
    redirect '/' if !(is_logged_in?)
    # a list of all member submissions from the table
    #list just this year
    #binding.pry
    @member = current_member
    @submissions = @member.submissions.all # <~ connect 2 table via MODEL
    # binding.pry
    erb :'submissions/index.html' # render the index view
  end

  get '/submissions/new' do # display form to create a new submission obj
    erb :'submissions/new.html'
  end

  post '/submissions' do # create a new sub obj based on form (user) input
    member = current_member
    @new_submission = member.submissions.new(params)
    @new_submission.save
    redirect "/submissions/#{@new_submission.id}"
  end

  get '/submissions/:id' do # SHOW route
    redirect '/' if !(is_logged_in?)
    # display ONE  obj
    # binding.pry
    @submission_obj = Submission.find_by(id: params[:id])
    @member = current_member
    @submissions = @member.submissions.all
        # binding.pry
    # @submission_obj = Submission.find( params[:id])
    if @submission_obj
      erb :'submissions/show.html'
    else
      redirect '/submissions'
    end
  end

  get '/submissions/:id/edit' do # EDIT route
    # display form to edit  obj form
    @submission_obj = Submission.find_by(id: params[:id])
    erb :'submission/edit.html'
  end

  patch '/submissions/:id' do # update data in table w/user input
    # option 1
    # @submission_obj = Submission.find_by(id: params[:id])
    # @submission_obj.theme = params[:theme]
    # @submission_obj.name = params[:name]
    #@submission_obj.use = params[:use] ? true : false
    # @submission_obj.save
    @submission_obj = Submission.find_by(id: params[:id])
    @submission_obj.update(
      category: params[:category],
      author: params[:author],
      email: params[:email],
      date_published: params[:date_published],
      title: params[:title],
      article: params[:article]
    )
    redirect '/submissions'
  end

  delete '/submissions/:id' do #delete obj from table
    @submission_obj = Submission.find_by(id: params[:id])
    @submission_obj.delete # | @submission_obj.destory
    redirect '/submissions'
  end
end
