class ProductsController < ApplicationController
    before_action :set_product, only: [:destroy]
    def create
        @product = Product.new(product_params)
        #byebug
        #@product.category
        @product.category = Category.find(params[:category_id])
        @product.save
        redirect_to @product.category
    end
    def destroy
        @product.destroy
        redirect_to @product.category
    end
    private
   def set_product
      @product = Product.find(params[:id])
    end

    def product_params
        params.require(:product).permit(:name, :price)
    end
end
