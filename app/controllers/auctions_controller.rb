class AuctionsController < ApplicationController
  before_action :set_auction, only: %i[ show edit update destroy ]

  # GET /auctions or /auctions.json
  def index
    @auctions = current_user.auctions
  end

  # GET /auctions/1 or /auctions/1.json
  def show
    @auction = current_user.auctions.find_by(id: params[:id])
    @owner = current_user
    unless @auction
      flash[:error] = "user unauthorized"
      redirect_to auctions_path
    end
  end

  # GET /auctions/new
  def new
    @auction = Auction.new
  end

  # GET /auctions/1/edit
  def edit
  end

  # POST /auctions or /auctions.json
  def create
    @auction = Auction.new(auction_params)
    current_user.auctions << @auction
    respond_to do |format|
      if @auction.save
        format.html { redirect_to @auction, notice: "Auction was successfully created." }
        format.json { render :show, status: :created, location: @auction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @auction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auctions/1 or /auctions/1.json
  def update
    respond_to do |format|
      if @auction.update(auction_params)
        format.html { redirect_to @auction, notice: "Auction was successfully updated." }
        format.json { render :show, status: :ok, location: @auction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @auction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auctions/1 or /auctions/1.json
  def destroy
    participants = Paricipant.where(auction_id: @auction.id)
    participants.delete_all
    @auction.destroy
    respond_to do |format|
      format.html { redirect_to auctions_url, notice: "Auction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auction
      @auction = Auction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def auction_params
      params.require(:auction).permit(:title, :description, :expiration_date, :starting_price, :price, :status, :image)
    end
end
