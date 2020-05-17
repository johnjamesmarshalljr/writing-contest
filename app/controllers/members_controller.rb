class MembersController < ApplicationController
  # auth system ~> signin/login, signup & signout/logout

  # signup - new user, add & auth them to out app

  get '/members/new' do # display a form // sign up form
    erb :'members/new'
  end

  post '/members' do # add member to table & auth use in app
    # binding.pry
    if params[:email] != "" && params[:password] != "" && params[:name] != ""
      #valid input

    @member = Member.create(params)
    session[:member_id] = @member.id
      redirect "/members/#{@member.id}"
    else
      #not valid input
    end
  end

  get '/members/show' do
    #binding.pry
    @member = current_member
    @submissions = @member.submissions.all
    # binding.pry
    # @member = Member.find_by(id: params[:id])

    erb :'/members/show.html'
  end



    #     redirect '/members/new'
    # else
    # new_member = Member.new(params)
    # new_member.save # saves member into table
      # auth member into app
      # session[:member_id] = new_member.id

      # erb :'/submissions/new.html'
      #redirecting here doesn't work for some reason
      #always sent me to get /submissions for some reason
      # redirect '/submissions/new.html'




  get '/members/:id' do #profile SHOW
    # redirect '/' if !(is_logged_in?)
    #binding.pry
    @member = current_member
    @submissions = @member.submissions.all
    erb :'/members/show.html'
    end
  end
