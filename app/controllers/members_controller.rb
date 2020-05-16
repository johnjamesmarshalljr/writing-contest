class MembersController < ApplicationController
  # auth system ~> signin/login, signup & signout/logout

  # signup - new user, add & auth them to out app

  get '/members/new' do # display a form
    erb :'members/new'
  end

  post '/members' do # add member to table & auth use in app
    # binding.pry
    if params[:email] == "" || params[:password] == ""
        redirect '/members/new'
    else
    new_member = Member.new(params)
    new_member.save # saves member into table
      # auth member into app
      session[:member_id] = new_member.id

      erb :'/submissions/new.html'

    end
  end
end
