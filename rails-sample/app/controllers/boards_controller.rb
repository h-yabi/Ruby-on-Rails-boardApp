class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    Board.create(board_params)
  end

  def show
    @board = Board.find(params[:id])
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    # updateでは、viewsを作成する必要がないので、インスタンス変数ではなくローカル変数になっている
    board = Board.find(params[:id])
    board.update(board_params)
    redirect_to board
  end

  private
    def board_params
      params.require(:board).permit(:name, :title, :body)
    end
end