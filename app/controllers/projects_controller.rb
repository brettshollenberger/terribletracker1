class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @client = User.where(email: params[:project][:client]).first
    params[:project].delete(:client)
    @project = @client.projects.build(params[:project])

    if @project.save
      redirect_to @project, notice: "Project successfully created"
    else
      redirect_to new_project_path, notice: "There was an error creating your project"
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])

    if @project.delete
      flash[:notice] = "Project deleted"
      redirect_to projects_path
    else
      flash[:error] = "There was an error deleting your project"
      redirect_to projects_path
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    params[:project].delete(:client)

    if @project.update_attributes(params[:project])
      flash[:notice] = "Project updated"
      redirect_to @project
    else
      flash[:error] = "Oops. There was an error updating your project."
      redirect_to @project
    end
  end
end
