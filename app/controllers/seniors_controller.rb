class SeniorsController < ApplicationController

    include SeniorsHelper
    before_filter :require_login

  def new
      @senior = Senior.new
  end

  def show
      if !your_senior(params[:id])
          return redirect_to seniors_path
      end

      @senior = Senior.find(params[:id])
      @memories = @senior.memories.limit(4).order("id desc")

      session[:myself] = @senior.id

      frasi = ["Che scuole elementari hai frequentato?",
               "Che lavori hai fatto?",
               "Cosa ricordi della tua gioventù?",
               "Qual'è stata la tua prima auto?",
               "Dove hai lavorato per la prima volta?",
               "Qual è stato il momento più bello della tua vita?",
               "Cosa ti ricordi del tuo primo amore?",
              ]

      @frase = frasi.sample
  end

  def index
      @seniors = User.find(session[:user_id]).seniors
      puts "SEI LOGGATOO COME: " + session[:user_id].to_s
  end



    def create

      @senior = Senior.new(params[:senior])
      @senior.user_id = session[:user_id]
      t = @senior.birthday.to_date

      if t > Date.current
        redirect_to new_senior_path, :notice => "Data non corretta"
      else
        if @senior.save
          first_story @senior
          redirect_to @senior
        else
          render 'new'
        end
      end
    end



  def edit
      if !your_senior(params[:id])
          return redirect_to seniors_path
      end

      @senior = Senior.find(params[:id])
      session[:return_to] = request.referer
  end


  def update
        if !your_senior(params[:id])
            return redirect_to seniors_path
        end

        @senior = Senior.find(params[:id])
        if @senior.update_attributes(params[:senior])
            redirect_to @senior, :notice =>  "Profilo aggiornato!"
        else
            flash[:notice] = "Non aggiornato.."
            render 'edit'
        end
  end


  def destroy
      if !your_senior(params[:id])
          return
      end

      senior = Senior.find(params[:id])
      senior.memories.destroy_all
      senior.destroy

      redirect_to seniors_path
  end


  def tree

  end


  def preview
        @senior = Senior.find(params[:senior_id])
        @memories = @senior.memories.where("privato = 'f'").order("data desc")
  end


  def getname_by_id
      id = params[:id]
      @senior = Senior.find(id);
      render :json => @senior
  end



    private

    def require_login
        unless !session[:user_id].nil?
            redirect_to root_path, :notice => "non sei loggato"
        end
    end


    def first_story(senior)
        first = Memory.new(data: senior.birthday, luogo: senior.city, privato: "true", senior_id: senior.id,
                           testo: "In questo bellissimo giorno sono venuto al mondo!", titolo: "Sono nato", image: "[born]")
        first.save
    end

end
