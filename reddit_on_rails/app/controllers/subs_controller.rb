class SubsController < ApplicationController
  before_action :require_login, except:[:show, :index]

  def new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.mod_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = current_user.subs.where(id: params[:id])
    @sub.update(sub_params)
    flash[:errors] = @sub.errors.full_messages
    redirect_to sub_url(@sub)

  end

  def show
    @sub = Sub.find(params[:id])
  end

  def index
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
