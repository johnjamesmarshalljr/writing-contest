class MembersController < ApplicationController

  get '/members/new' do
    erb :'members/new'
  end

  post '/members' do
    if params[:email] != "" && params[:password] != "" && params[:name] != ""
      @member = Member.create(params)
      session[:member_id] = @member.id
        redirect "/members/#{@member.id}"
    else
      erb :'members/new'
    end 
  end

  get '/members/:id' do #profile SHOW
    redirect '/' if !(is_logged_in?)
  
    @member = current_member
    @submissions = @member.submissions
    erb :'/members/show.html'
    end
  end
