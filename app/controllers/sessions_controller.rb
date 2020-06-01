class SessionsController < ApplicationController

  get '/login' do
    erb :'sessions/new'
  end

  post '/login' do
    found_member = Member.find_by(email: params[:email])
    if found_member && found_member.authenticate(params[:password])
      session[:member_id] = found_member.id
      redirect "/members/#{found_member.id}"
    else
       erb :'sessions/new'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end
