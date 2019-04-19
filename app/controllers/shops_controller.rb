class ShopsController < ApplicationController
  def show
    @shop = Shop.includes(openings: :day).find_by(id: params[:id])
  end
end
