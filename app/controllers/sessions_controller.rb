class SessionsController < ApplicationController
  # login - returning user, auth. them into our app
  # logout - remove their info from sessions

  get '/login' do
    erb :'sessions/new'
  end

  post '/login' do
    #recieve the log in form, find user and log them in (create a session)
    found_member = Member.find_by(email: params[:email])
    if found_member && found_member.authenticate(params[:password]) # find a user & password is right
      # login & redirect sowmehere in site
      session[:member_id] = found_member.id #this logs the user in
      redirect "/members/#{found_member.id}"
    else
      # ADD ERROR: alert('Error with login info ')
       erb :'sessions/new'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end
