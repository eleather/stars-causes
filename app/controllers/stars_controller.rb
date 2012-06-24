class StarsController < ApplicationController
  def index
    @stars = Star.recent(10)
    @star = Star.new
    this_week = Date.today.beginning_of_week
    last_week = this_week - 1.week
    @current_superstars = Superstar.this_week
    @last_weeks_superstars = Superstar.last_week
  end

  def edit
    @star = Star.find(params[:id])
  end

  def create
    @star = Star.new(params[:star].merge(:from_id => current_user.id))
    if !@star.save
      flash[:notice] = "To give a star, you need both a recipient and a reason."
    end
    redirect_to :back
  end

  def update
    @star = Star.find(params[:id])

    if @star.update_attributes(params[:star])
      redirect_to(@star)
    else
      render :action => "edit"
    end
  end

  def destroy
    @star = Star.find(params[:id])
    @star.destroy

    redirect_to(stars_path)
  end
end
