class GameController < ApplicationController
  # GET /words
  # GET /words.json
  def index
    @words = Word.order("RANDOM()").limit(20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @words }
    end
  end

end