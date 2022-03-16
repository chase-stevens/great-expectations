class Api::V1::PairingsController < ActionController::API
  def index
    @pairings = Pairing.where("count > ?", 1)
    @pairings = @pairings.where(chapter: params[:chapters].split(",").map(&:to_i)) if params[:chapters].present?
    @pairings = @pairings.where(source: params[:source]) if params[:source].present?

    render json: @pairings
  end

  def show
    @pairing = Pairing.where(phrase: params[:phrase])
    @pairing = @pairing.where(chapter: params[:chapters].split(",").map(&:to_i)) if params[:chapters].present?
    @pairing = @pairing.where(source: params[:source]) if params[:source].present?

    render json: @pairing
  end
end
