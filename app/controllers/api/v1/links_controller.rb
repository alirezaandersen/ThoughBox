module Api
  module V1
    class LinksController < ApiController
      def index
        respond_with Link.all
      end

      def show
        respond_with Link.find(params[:id])
      end

      def update
      @link = Link.find(params[:id])

      if @link.update(link_params)
        respond_to do |format|
          format.html do
            redirect_to links_path, flash: { success: 'Link updated!' }
          end
          format.json { render json: @link }
        end
      else
        flash.now[:error] = 'Invalid parameters'
        render :edit
      end
    end

      private
        def link_params
          params.permit("read", "url", "title")
        end

        def authorized?
          redirect_to root_path unless current_user
        end
    end
  end
end
