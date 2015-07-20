class StaticPagesController < ApplicationController

  def home
    @micropost = current_user.microposts.build if logged_in?
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
