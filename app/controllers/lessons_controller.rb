class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
    render 'lessons/index'
  end

  def new
    @lesson = Lesson.new
    render 'lessons/new'
  end

  def create
    @lesson = Lesson.new name: params[:name],
                          content: params[:content]
    if @lesson.save
      flash[:notice] = "#{@lesson.name.upcase} was created."
      redirect_to("/lessons/")
    else
      render 'lessons/new'
    end
  end

  def show
    @lessons = Lesson.all
    @lesson = Lesson.find params[:id]
    render "lessons/show"
  end


  def edit
    @lesson = Lesson.find params[:id]
    render 'lessons/edit'
  end

  def update
    @lesson = Lesson.find params[:id]
    if @lesson.update name: params[:name],
                      content: params[:content]
      render 'lessons/show'
    else
      render 'lessons/edit'
    end
  end

  def destroy
    @lesson = Lesson.find params[:id]
    @name = []
    @name << @lesson.name.upcase
    @lesson.destroy
    flash[:notice] = "#{@name[0]} was removed."
    redirect_to('/lessons')
  end

end
