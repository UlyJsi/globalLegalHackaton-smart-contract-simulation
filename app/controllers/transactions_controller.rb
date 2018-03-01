class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:edit, :show]

  def index
    @transactions = Transaction.paginate(page: params[:page])
  end
  
  def new
    @transaction = Transaction.new
    @users = User.all
    @user = User.find(9)
  end

  def create
    @transaction = Transaction.new(transaction_params) # in private section
    @transaction.user = current_user
    if @transaction.save
        flash[:success] = "File was succesfully sent."
        redirect_to "/users/9"
        Article.last.update_attribute(:created_at, Time.now)
    else
        render "new"
    end
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:user_id)
  end

end
