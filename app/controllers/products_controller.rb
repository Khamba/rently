class ProductsController < ApplicationController

  def index
    if params[:sort_by] == 'price'
      @products = Product.all.order(:rent_price)
    elsif params[:sort_by] == 'price_desc'
      @products = Product.all.order(rent_price: :desc)
    else
      @products = Product.all # sort by popularity when popularity is implemented
    end
  end

  def show
    @product = Product.find(params[:id])
    @product_images = @product.product_images.all
  end

  def new
    @product = Product.new
    @product_image = @product.product_images.build
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        errors = ""
        if params[:product_images]
          params[:product_images]['image'].each do |a|
            @product_image = @product.product_images.new(:image => a)
            unless @product_image.save
              errors += @product_image.errors.full_messages.to_sentence
            end
          end
        end
        format.html { redirect_to(@product, notice: 'Product was successfully created. ' + errors) }
      else
        @product_image = @product.product_images.build
        format.html { render action: 'new' }
      end
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(product_params)
       format.html { redirect_to @product, notice: 'Product was successfully updated.' }
      else
       format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully deleted.'
  end

  def add_images
    @product = Product.find(params[:id])
  end

  def create_images
    errors = ""
    @product = Product.find(params[:id])
    params[:product_images]['image'].each do |a|
      @product_image = @product.product_images.new(:image => a)
      unless @product_image.save
        errors += @product_image.errors.full_messages.to_sentence
      end
    end
    redirect_to @product, notice: errors
  end

  def like
    respond_to do |format|
      format.js do
        @product = Product.find(params[:id])

        @user.toggle_like(@product)
        render json: { status: 200 }
      end
    end    
  end

  def wishlist
    respond_to do |format|
      format.js do
        @product = Product.find(params[:id])

        @user.toggle_from_wishlist(@product)
        render json: { status: 200 }
      end
    end    
  end

  private
    def product_params
      params.require(:product).permit(:name, :rent_price, :actual_price, :details, :description, product_images_attributes: [:image])
    end

end
