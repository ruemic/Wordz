class GameAPIController < ApplicationController

  respond_to :json
  actions :index

  def index
    @words = Word.order("RANDOM()").where(:correct => true).limit(30)
    render json: @words
  end

end