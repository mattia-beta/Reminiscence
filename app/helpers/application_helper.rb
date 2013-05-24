module ApplicationHelper

    include FriendshipsHelper

    def titolo_completo(sotto_titolo)
        titolo_base = "Reminiscence"
        if sotto_titolo.empty?
            return titolo_base
        else
            return "#{titolo_base} | #{sotto_titolo}"
        end
    end

end
