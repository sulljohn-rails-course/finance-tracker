class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_from_lookup(params[:stock])
      if @stock
        render 'users/my_portfolio'
      else
        flash[:danger] = "You have entered incorrect ticker"
        redirect_to my_portfolio_path
      end
    else
      flash[:danger] = "You have entered an empty string"
      redirect_to my_portfolio_path
    end
  end
end