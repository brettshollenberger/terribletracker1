class ProjectsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = current_user
    @projects = @user.projects
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])

    if @project.save
      redirect_to @project, notice: "Project successfully created"
    else
      redirect_to new_project_path, notice: "There was an error creating your project"
    end
  end

  def show
    begin
      @user = current_user
      @project = @user.projects.find(params[:id])

      @user_stories = @project.user_stories.order("created_at DESC").all
      @story_owner = StoryOwner.new
    rescue
      flash[:error] = "You don't have permission to access that project"
      redirect_to projects_path
    end


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
