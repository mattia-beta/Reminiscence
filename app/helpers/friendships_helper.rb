module FriendshipsHelper


    def is_friend? (me, other)
        result = Friendship.where("senior_id = '#{me}' and friend_id = '#{other}' ")

        if(result.size == 0)
            puts("NON SEI GIA AMICO");
            return false
        end

        puts("SEI GIA AMICO");
        return true
    end


end
