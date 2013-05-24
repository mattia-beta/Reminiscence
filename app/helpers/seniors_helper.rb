module SeniorsHelper

    def your_senior id
        if Senior.find(id).user_id == session[:user_id]
            return true
        else
            return false
        end
    end

end
