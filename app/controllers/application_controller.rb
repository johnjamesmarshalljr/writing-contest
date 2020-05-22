require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    erb :welcome
  end

  helpers do
      def is_logged_in?
        session.has_key?(:member_id)
      end

      def current_member
         @current_member ||= Member.find(session[:member_id]) if is_logged_in?
      end

      def authorized_to_edit?(submission)
        submission.member == current_member
      end
    end

end
