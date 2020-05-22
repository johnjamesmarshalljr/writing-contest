class SubmissionsController < ApplicationController

  get '/submissions' do # index
    redirect '/' if !(is_logged_in?)
    #update -- list just this year
    @member = current_member
    @submissions = @member.submissions # <~ connect 2 table via MODEL
    erb :'submissions/index.html' # render the index view
  end

  get '/submissions/new' do # display form to create a new submission obj
    erb :'submissions/new.html'
  end

  post '/submissions' do # create a new sub obj based on form (user) input
    if !is_logged_in?
      redirect '/'
    end

    if params[:article] != ""
      member = current_member
      @new_submission = member.submissions.new(params)
      @new_submission.save
    redirect "/submissions/#{@new_submission.id}"
    else
      redirect '/submissions/new'
    end
  end

  get '/submissions/:id' do # SHOW route
    redirect '/' if !(is_logged_in?)
    # display ONE  obj
    # binding.pry
    @submission_obj = Submission.find_by(id: params[:id])
    @member = current_member
    @submissions = @member.submissions.all
    @my_article = @submission_obj.article
    @splitted = @my_article.split()
    if @submission_obj
      erb :'submissions/show.html'
    else
      redirect '/submissions'
    end
  end

  get '/submissions/:id/edit' do # EDIT route
    # display form to edit obj
    set_submission
    if is_logged_in?
      if @submission_obj.member == current_member
        erb :'submissions/edit.html'
      else
        redirect "members/#{current_member.id}"
      end
    else
    redirect '/'
  end
  end

  patch '/submissions/:id' do # update data in table w/user input
    set_submission

    if is_logged_in?
      if @submission_obj.member == current_member
          @submission_obj.update(
            category: params[:category],
            author: params[:author],
            email: params[:email],
            date_published: params[:date_published],
            title: params[:title],
            article: params[:article]
          )
            redirect "submissions/#{@submission_obj.id}"
      else
        redirect "members/#{current_member.id}"
      end
      else
        redirect '/'
      end
    end

      delete '/submissions/:id' do #delete obj from table
        redirect '/' if !(is_logged_in?)
        set_submission
        if authorized_to_edit?(@submission_obj)
          @submission_obj.delete # | @submission_obj.destory
          redirect '/submissions'
        else
          redirect '/submissions'
        end
      end

      def set_submission
        @submission_obj = Submission.find_by(id: params[:id])
      end


end
