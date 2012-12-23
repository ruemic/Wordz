class Api::WordsController < InheritedResources::Base

  respond_to :json
  actions :index, :create, :update, :destroy

  def index
    @words = Word.order("id").page(params[:page]).per_page(10)
    render json: @words
  end

end