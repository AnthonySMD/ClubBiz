class ClubsController < ApplicationController
 
    before_action :set_club, only: [:show, :edit, :update, :destroy]

    def my
      if !user_signed_in?
        redirect_to(main_landing_path)
      else
       @my_clubs = current_user.clubs
      end
    end

    def join
      @club = Club.find(params[:id])
      if !current_user.clubs.include?(@club)
        current_user.clubs << @club
      end
      redirect_to(@club)
    end

    def show
    end

    def index
      @clubs = Club.all
    end

    def new
      @club = Club.new
    end

    def my
      if !user_signed_in?
        redirect_to(main_landing_path)
      else
        my_clubs = current_user.clubs
        @my_clubs = []
        my_clubs.each do |club|
          club.clubs.each do |club|
            @my_clubs << club
          end
        end
      end
    end

    def edit
    end

    def create
      @club = Club.new(club_params)

      respond_to do |format|
        if @club.save
          format.html { redirect_to @club, notice: 'club was successfully created.' }
          format.json { render action: 'show', status: :created, location: @club }
        else
          format.html { render action: 'new' }
          format.json { render json: @club.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @club.update(tweet_params)
          format.html { redirect_to @club, notice: 'Club was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @club.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @club.destroy
      respond_to do |format|
        format.html { redirect_to clubs_url }
        format.json { head :no_content }
      end
    end
    
    def purchase_ticket
      if @club.tickets.empty?
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_club
        @club = Club.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def club_params
        params.require(:club).permit(:name, :category, :president, :email, :description)
      end
end

