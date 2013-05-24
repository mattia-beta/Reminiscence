module MemoriesHelper

    def append_results(dati, vettore)
        for tmp in dati do
            if !vettore.include?(tmp)
                vettore.push(tmp)
            end
        end

        return vettore
    end


end
