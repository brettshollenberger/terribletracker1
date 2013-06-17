class StoryOwnersController < ApplicationController
  def create
    @project = Project.find(params[:story_owner][:project])
    params[:story_owner].delete(:project)
    @story_owner = StoryOwner.new(params[:story_owner])

    if @story_owner.save
      redirect_to @project
    else
      flash[:error] = "There was an error accepting this user story"
      redirect_to @project
    end
  end

  def index
  end
end
