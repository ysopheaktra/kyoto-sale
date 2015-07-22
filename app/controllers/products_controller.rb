class ProductsController < ApplicationController
  before_action :admin_user,     only: [:destroy, :edit, :update, :create, :new]

  def home
     @products = Product.where(:sold => false).paginate(page: params[:page], :per_page => 6)
  end

  def index
    @products = Product.paginate(page: params[:page], :per_page => 12)
  end

  def new
  	@product = Product.new
  end
  def show
  	@product = Product.find(params[:id])
    @microposts = @product.microposts.paginate(page: params[:page], :per_page => 10)
    @micropost = @product.microposts.build
    session[:product_id] = params[:id]
  end
  
  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "Deleted successful"
    redirect_to products_url
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Created successful"
      redirect_to products_url
    else
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      flash[:success] = "Updated successful"
      redirect_to @product
    else
      render 'edit'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  private

    def product_params
      params.require(:product).permit(:name, :price, :picture,
                                   :description, :sold)
    end

end
