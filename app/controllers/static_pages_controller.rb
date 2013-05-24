class StaticPagesController < ApplicationController

    def contact
    end

    def home
        session[:oauth] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, SITE_URL + '/home/callback')
        @auth_url =  session[:oauth].url_for_oauth_code( :permissions => "email,user_about_me,user_hometown" )
        puts session.to_s + "<<< session"

        respond_to do |format|
            format.html {  }
        end


        if !session[:user_id].nil?
             redirect_to seniors_path
        end
    end

    def demo
    end


    def faq
    end


end
