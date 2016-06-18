class ProductImagesController < ApplicationController

  def edit
    @product_image = ProductImage.find(params[:id])
  end

  def update
    @product_image = ProductImage.find(params[:id])
    respond_to do |format|
      if @product_image.update(product_image_params)
        format.html { redirect_to @product_image.product, notice: 'Product image was successfully updated.' }
      else
        format.html { render action: :edit, notice: 'Product image could not be updated.' }
      end 
    end
  end

  def destroy
    @product_image = ProductImage.find(params[:id])
    @product = @product_image.product
    @product_image.remove_image!
    @product_image.destroy
    redirect_to @product, notice: 'Product image was successfully deleted.'
  end

  private
    def product_image_params
      params.require(:product_image).permit(:image)
    end

end
