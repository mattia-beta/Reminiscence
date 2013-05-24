class FriendshipsController < ApplicationController

    include FriendshipsHelper

    def create
        @senior = Senior.find(params[:senior_id])

        if !is_friend?(params[:senior_id], params[:friend_id])
            @friendship = @senior.friendships.build(:friend_id => params[:friend_id])
            if @friendship.save
                flash[:notice] = "Aggiunto agli amici."
                redirect_to  friendships_find_path
            else
                flash[:notice] = "Impossibile creare amicizia."
                redirect_to  friendships_find_path
            end
        else
            flash[:notice] = "Sei gia amico"
            redirect_to  friendships_find_path
        end
    end



    def destroy
        @senior = Senior.find(params[:senior_id])

        @friendship = @senior.friendships.find(params[:id])
        @friendship.destroy
        flash[:notice] = "Amicizia rimossa con successo."
        redirect_to @senior
    end



    def find
        @myself = session[:myself]
        @seniors = Senior.search(params[:search])
    end

end
