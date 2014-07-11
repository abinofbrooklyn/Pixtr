class GroupsController < ApplicationController
  before_action :require_login, except: [:index, :show]
 
  def index
    @groups = Group.all
  end
 
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.users << current_user

    if @group.save
      redirect_to @group, notice: "Group created sucessfully"
    else
      render :new
    end
  end

  def show
   @group = Group.find(params[:id])
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end
end
