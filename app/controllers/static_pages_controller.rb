class StaticPagesController < ApplicationController

  def home
    @product = Product.find(1)
    @micropost = @product.microposts.build
  end

  def help
  end

  def aboutus
  end

  def contact
  end

  def policy
  end

  def term
  end
  
end
