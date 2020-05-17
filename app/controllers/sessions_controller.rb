class SessionsController < ApplicationController
  # login - returning user, auth. them into our app
  # logout - remove their info from sessions

  get '/login' do
    erb :'sessions/new'
  end

  post '/login' do
    # binding.pry
    new_member = Member.find_by(email: params[:email])

    if new_member && new_member.authenticate(params[:password]) # find a user & password is right
      # login & redirct sowmehere in site
      session[:member_id] = new_member.id
      redirect '/submissions/new.html'
    else
      # alert('Error with login info ')
       erb :'sessions/new'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end