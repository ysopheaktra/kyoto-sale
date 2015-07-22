class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  
 
  def create
    @product = Product.find(session[:product_id])
    @micropost = @product.microposts.build(micropost_params)
    @micropost.content = current_user.name + ": " + @micropost.content
    if @micropost.save
      flash[:success] = "Success"
      redirect_to @product
    else
      flash[:fail] = "fail"
    end
  end

  def destroy
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end
end