class LinksController < ApplicationController
  def index
    if current_user.nil?
      redirect_to root_path
    else
      @link = Link.new
      @links = current_user.links.all
    end
  end

  def create
    @link = current_user.links.new(link_params)

    if @link.save
      flash[:success] = "Your link #{@link.title} has been saved!"
      redirect_to links_path
    else
      flash.now[:danger] = @link.errors.full_messages.join(', ')
      render "index"
    end
  end

  private

    def link_params
      params.require(:link).permit(:title, :url)
    end
end
