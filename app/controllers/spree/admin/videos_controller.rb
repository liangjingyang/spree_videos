module Spree
  module Admin
    class VideosController < ResourceController
      before_action :load_data

      create.before :set_product
      update.before :set_product

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
