class MemoriesController < ApplicationController

    include SeniorsHelper
    include MemoriesHelper

    respond_to :html, :json, :xml

    def index
        if !your_senior params[:senior_id]
            redirect_to root_path
        end

        @senior = Senior.find(params[:senior_id])
        @memories = @senior.memories
    end


    def new
        @memory = Memory.new
    end


    def create
        @memory = Memory.new(params[:memory])
        @memory.senior_id = params[:senior_id]
        @senior = Senior.find(params[:senior_id])

        if @memory.save
            redirect_to senior_memory_path(@senior, @memory)
        else
            render 'new'
        end
    end


    def show
        if !your_senior params[:senior_id]
            redirect_to root_path
        end

        @senior = Senior.find(params[:senior_id])
        @memory = Memory.find(params[:id])
    end


    def timeline
        if !your_senior params[:senior_id]
            redirect_to root_path
        end

        @memories = Senior.find(params[:senior_id]).memories
        #respond_with @memories
    end


    def edit
        if !your_senior(params[:senior_id])
            return redirect_to seniors_path
        end

        @senior = Senior.find(params[:senior_id])
        @memory = Memory.find(params[:id])

        session[:return_to] = request.referer
    end


    def update
        if !your_senior(params[:senior_id])
            return redirect_to seniors_path
        end

        @senior = Senior.find(params[:senior_id])
        @memory = Memory.find(params[:id])

        if @memory.update_attributes(params[:memory])
            redirect_to senior_memory_path(@senior, @memory), :notice => "Ricordo aggiornato!"
        else
            flash[:notice] = "Non aggiornato.."
            render 'edit'
        end
    end


    def destroy
        if !your_senior(params[:senior_id])
            return redirect_to seniors_path
        end

        @memory = Memory.find(params[:id])
        @memory.destroy

        redirect_to senior_path(Senior.find(params[:senior_id]))
    end


    def tellme
        @output = []

        for keyword in params[:keywords].to_s.split(',') do

            if !keyword.nil? || keyword != ' '
                @things = Thing.where("name LIKE '%#{keyword}%'")
                @output = append_results(@things, @output)

                @cities = City.where("name LIKE '%#{keyword}%'")
                @output = append_results(@cities, @output)

                @events = Event.where("name LIKE '%#{keyword}%'")
                @output = append_results(@events, @output)

            end
        end

        render :json => @output
    end



    def tellme_around
        @cities = City.where("year LIKE '%#{params[:data]}%'");
        render :json => @cities
    end


    def tellme_friend
        @keyword = params[:title]

        @output = Memory.where("titolo LIKE '%#{@keyword}%' and privato = 'f'");
        render :json => @output
    end



end
