class UserStoriesController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @user_story = UserStory.new
  end

  def create
    @project = Project.find(params[:project_id])
    @developer = User.where(email: params[:user_story][:developer]).first
    @user_story = @project.user_stories.new
    @user_story.developer = @developer
    params[:user_story].delete(:developer)
    @user_story.update_attributes(params[:user_story])

    if @user_story.save
      flash[:notice] = "User Story created"
      redirect_to @project
    else
      flash[:error] = "There was an error creating your user story"
      redirect_to new_project_user_story_path
    end
  end

  def show
    @project = Project.find(params[:project_id])
    @user_story = UserStory.find(params[:id])
  end

  def edit
    @project = Project.find(params[:project_id])
    @user_story = UserStory.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @user_story = UserStory.find(params[:id])

    if @user_story.update_attributes(params[:user_story])
      flash[:notice] = "User story updated"
      redirect_to project_user_story_path(@project, @user_story)
    else
      flash[:error] = "There was an error updating your user story"
      redirect_to project_user_story_path(@project, @user_story)
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @user_story = UserStory.find(params[:id])

    if @user_story.delete
      flash[:notice] = "User story deleted"
      redirect_to @project
    else
      flash[:error] = "There was an error deleting your user story"
      redirect_to @project
    end
  end
end
