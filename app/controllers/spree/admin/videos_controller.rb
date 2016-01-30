module Spree
  module Admin
    class VideosController < ResourceController
      belongs_to "spree/product", find_by: :slug
      before_action :load_edit_data, except: :index
      before_action :load_index_data, only: :index
      create.before :set_viewable
      update.before :set_viewable

      def create
        invoke_callbacks(:create, :before)
        @object.attributes = permitted_resource_params

        if @object.valid?
          super
        else
          invoke_callbacks(:create, :fails)
          flash[:error] = @object.errors.full_messages.join(", ")
          redirect_to location_after_save
        end
      end

      protected
      def location_after_save
        spree.admin_product_videos_path(@product)
      end

      def location_after_destroy
        spree.admin_product_videos_url(@product)
      end

      def permitted_resource_params
        params.require(:video).permit(permitted_video_attributes)
      end

      def permitted_video_attributes
        [:alt, :attachment, :variant_id, :position]
      end

      def set_viewable
        @object.variant_id = params[:video][:variant_id]
      end

      def load_index_data
        @product = Product.friendly.includes(*variant_index_includes).find(params[:product_id])
      end

      def load_edit_data
        @product = Product.friendly.includes(*variant_edit_includes).find(params[:product_id])
        @variants = @product.variants.map do |variant|
          [variant.sku_and_options_text, variant.id]
        end
        @variants.insert(0, [Spree.t(:all), @product.master.id])
      end


      def variant_index_includes
        [
            variant_videos: [variant: { option_values: :option_type }]
        ]
      end

      def variant_edit_includes
        [
            variants_including_master: { option_values: :option_type, videos: :variant }
        ]
      end
    end
  end
end
