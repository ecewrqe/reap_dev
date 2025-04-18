class ProductsController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_product, only: %i[ show edit update destroy ]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    puts "===>new"
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      # Redirect to the product's show page
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    puts "Editing product"
  end

  def update
    puts "Updating product: #{product_params["inventory_count"]}"
    if @product.update(product_params)
      # Redirect to the product's show page
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.expect(product: [ :name, :description, :featured_image, :inventory_count ])
    end
end
