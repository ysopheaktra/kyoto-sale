class ProductsController < ApplicationController
  before_action :admin_user,     only: [:destroy, :edit, :update, :create, :new] #only admin user can alter products

  #paginate -> limite number of records per page
  def newitem
    @products = Product.where(:sold => true).paginate(page: params[:page], :per_page => 6)
    #DAY(birth_date) = ? AND MONTH(birth_date) = ?", Date.today.day, Date.today.month]
  end

  def search
     @query = params[:search]
     if @query.empty?
      redirect_to :action => 'home'
     else
      @name = "%" + @query + "%"
      @products = Product.where("sold = ? AND (id = ? OR name LIKE ? OR description LIKE ?)", false, @query, @name, @name).paginate(page: params[:page], :per_page => 6)
     end
  end

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
