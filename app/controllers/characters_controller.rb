class CharactersController < ActionController::Base

  def index
    @characters = Character.all(params[:current_page].to_i || 0)
  end

end
