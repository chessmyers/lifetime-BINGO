class BingoHallsController < ApplicationController
  before_action :set_bingo_hall, only: %i[ show edit update destroy ]

  # GET /bingo_halls or /bingo_halls.json
  def index
    @bingo_halls = BingoHall.all
  end

  # GET /bingo_halls/1 or /bingo_halls/1.json
  def show
    @bingo_hall = BingoHall.find(params[:id])
    @bingo_boards = @bingo_hall.bingo_boards

    if (session[:player_id].present?)
      @current_bingo_board = Player.find(session[:player_id]).bingo_board
    else
      @current_bingo_board = @bingo_hall.bingo_boards.create
      player = Player.create(name: 'Anonymous', bingo_board: @current_bingo_board)
      session[:player_id] = player.id
    end
  end

  # GET /bingo_halls/new
  def new
    @bingo_hall = BingoHall.new
  end

  # GET /bingo_halls/1/edit
  def edit
  end

  # POST /bingo_halls or /bingo_halls.json
  def create
    @bingo_hall = BingoHall.new(name: bingo_hall_params[:name])

    respond_to do |format|
      if @bingo_hall.save
        bingo_board = @bingo_hall.bingo_boards.create
        player = Player.create(name: bingo_hall_params[:player_name], bingo_board: bingo_board)
        session[:player_id] = player.id
        format.html { redirect_to @bingo_hall, notice: "Bingo hall was successfully created." }
        format.json { render :show, status: :created, location: @bingo_hall }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bingo_hall.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bingo_halls/1 or /bingo_halls/1.json
  def update
    respond_to do |format|
      if @bingo_hall.update(bingo_hall_params)
        format.html { redirect_to @bingo_hall, notice: "Bingo hall was successfully updated." }
        format.json { render :show, status: :ok, location: @bingo_hall }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bingo_hall.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bingo_halls/1 or /bingo_halls/1.json
  def destroy
    @bingo_hall.destroy
    respond_to do |format|
      format.html { redirect_to bingo_halls_url, notice: "Bingo hall was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bingo_hall
      @bingo_hall = BingoHall.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bingo_hall_params
      params.require(:bingo_hall).permit(:name, :player_name)
    end
end
