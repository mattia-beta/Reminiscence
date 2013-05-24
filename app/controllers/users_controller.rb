class UsersController < ApplicationController

  def create
      if params[:code]
          if session[:access_token].nil?
              # acknowledge code and get access token from FB
              session[:access_token] = session[:oauth].get_access_token(params[:code])
          end
      end

      # auth established, now do a graph call:

      @api = Koala::Facebook::API.new(session[:access_token])
      begin
          #@graph_data = @api.get_object("/me/statuses", "fields" => "message")
          @graph_data = @api.get_object("/me")

          puts "IO SO CHE TI CHIAMI " + @graph_data["first_name"]

          if !User.exists?(id_facebook: @graph_data["id"])
              utente = User.new(name: @graph_data["first_name"],
                                surname: @graph_data["last_name"],
                                mail: @graph_data["email"],
                                lang: @graph_data["locale"],
                                id_facebook: @graph_data["id"],
                                )
              utente.save
          end


          session[:user_id] = User.find_all_by_id_facebook(@graph_data["id"])[0]["id"]

          redirect_to seniors_path, :notice => "non aggiunto xk sei brutto"


      rescue Exception => ex
          puts ex.message
          redirect_to root_path, :notice => ex.message
      end


      respond_to do |format|
          format.html {}
      end


  end

    def logout
        reset_session
        redirect_to root_path
    end
end
