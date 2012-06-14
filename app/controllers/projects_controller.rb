class ProjectsController < ApplicationController
  def index
   @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find params[:id]
    @task = @project.tasks.build
  end

  def create
    logger.debug params[:project];
    @project = Project.create params[:project]
    if @project.valid?
      redirect_to projects_path
    else
      render :new
    end
  end

  def destroy
    @project = Project.find params[:id]
    @project.destroy
    redirect_to projects_path
  end
end
