class ClientsController < ApplicationController

  def new
    @project = Project.find(params[:format])
    @client = User.new
  end

  def create
    @project = Project.find(params[:user][:project_id])
    params[:user].delete(:project_id)
    @user = User.new(params[:user])

    binding.pry
    if @user.save
      @membership = Membership.new(project_id: @project.id, role: "client", user_id: @user.id)
      @membership.save
      flash[:notice] = "Client added"
      redirect_to @project
    else
      flash[:error] = "There was an error creating your client"
      redirect_to @project
    end
  end

end
