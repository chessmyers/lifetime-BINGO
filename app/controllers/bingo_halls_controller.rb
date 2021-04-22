class BingoHallsController < ApplicationController
  before_action :set_bingo_hall, only: %i[ show edit update destroy ]
  PHRASES = ['chihuahua', 'pitbull', 'mutt', 'beagle', 'great dane', 'black lab', 'golden retriever', 'malumut', 'brussles griffin', 'basenji'].freeze
  # GET /bingo_halls or /bingo_halls.json
  def index
    @bingo_halls = BingoHall.all
  end

  # GET /bingo_halls/1 or /bingo_halls/1.json
  def show
    @bingo_hall = BingoHall.find(params[:id])
    @bingo_boards = @bingo_hall.bingo_boards
    @current_player = Player.find_by(id: cookies[:player_id])
    if !@current_player.present?
      redirect_to new_player_path(bingo_hall_id: @bingo_hall.id)
    else
      @other_players_bingo_boards = @bingo_boards.where.not(id: @current_player.bingo_board.id)
    end
    BingoHallChannel.broadcast_to(@bingo_hall, @bingo_hall)

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
        make_player_and_bingo_board(@bingo_hall)
        format.html { redirect_to @bingo_hall, notice: "Bingo hall was successfully created." }
        format.json { render :show, status: :created, location: @bingo_hall, player_id: player.id }
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

  def make_player_and_bingo_board(bingo_hall)
    bingo_board = bingo_hall.bingo_boards.create
    make_squares(bingo_board)
    player = Player.create(name: bingo_hall_params[:player_name], bingo_board: bingo_board)
    cookies[:player_id] = player.id
  end

  def make_squares(bingo_board)
    available_phrases = PHRASES

    [0..9].each do |x|
      phrase = available_phrases[rand(available_phrases.length)]
      Square.create(position: x, phrase: phrase, value: x == 4, bingo_board_id: bingo_board.id)
      available_phrases = available_phrases - phrase
    end
    end
end
