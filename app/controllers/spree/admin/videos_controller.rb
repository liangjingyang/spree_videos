module Spree
  module Admin
    class VideosController < ResourceController
      before_action :load_data
      before_action :set_product, only: [:create, :update]

      def update_positions
        params[:positions].each do |id, index|
          Video.update_all(['position=?', index], ['id=?', id])
        end

        respond_to do |format|
          format.js  { render :text => 'Ok' }
        end
      end

      private
  
      def location_after_save
        admin_product_videos_url(@product)
      end

      def load_data
        @product = Product.friendly.find(params[:product_id])
      end

      def set_product
        @video.watchable = @product
      end
    end
  end
end
