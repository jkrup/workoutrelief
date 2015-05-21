class ExercisesController < ApplicationController

  def about
    #render text: ENV['MANDRILL_USERNAME']
  end

  def whatisit
  end

  def vote
    @exercise_id = params[:exercise_id]
    @exercise = Exercise.find(@exercise_id)
    begin
      current_user.vote_for @exercise
      redirect_to bodypart_path(bodypart_id: @exercise.bodypart_id), flash: { success: "Upvoted #{@exercise.name}" }
    rescue
      redirect_to bodypart_path(bodypart_id: @exercise.bodypart_id), flash: { alert: "An error has occured, did you vote twice?" }
    end
  end

  def faillogin
    redirect_to root_path, flash: {alert: "Incorrect username/password combination"}
  end
  # GET /exercises
  # GET /exercises.json
  def index
    @exercises = Exercise.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exercises }
    end
  end

  # GET /exercises/1
  # GET /exercises/1.json
  def show
    @exercise = Exercise.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exercise }
    end
  end

  # GET /exercises/new
  # GET /exercises/new.json
  def new
    if current_user
      @bodypart_id = params[:bodypart_id]
      @exercise = Exercise.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @exercise }
      end
    else
      redirect_to root_path, flash: {alert: "You must sign in to create a new routine"}

    end
  end

  # GET /exercises/1/edit
  def edit
    @exercise = Exercise.find(params[:id])
    if current_user && current_user.id == @exercise.user_id
    else
      redirect_to root_path, flash: {alert: "Must Be Creator To Edit"}
    end
  end

  # POST /exercises
  # POST /exercises.json
  def create
    if current_user
      @exercise = Exercise.new(params[:exercise])
      @exercise.user_id = current_user.id
    else
      redirect_to root_path, flash: {alert: "Must login to create"}
    end

    respond_to do |format|
      if @exercise.save
        current_user.vote_for @exercise
        format.html { redirect_to bodypart_path(bodypart_id: @exercise.bodypart_id), notice: 'Exercise was successfully created.' }
        format.json { render json: @exercise, status: :created, location: @exercise }
      else
        format.html { render action: "new" }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  def with_bodypart

    @bodypart = BodyPart.find(params[:bodypart_id])
    @exercises = Exercise.tally.where(bodypart_id: @bodypart.id).tally

    respond_to do |format|
      if @exercises
        format.html
        format.json { render json: @exercises }
      else
        render text: "No Exercises found for that bodypart"
      end
    end

  end

  def body
    respond_to do |format|
      format.html
    end
  end

  # PUT /exercises/1
  # PUT /exercises/1.json
  def update

    @exercise = Exercise.find(params[:id])

    if current_user && current_user.id == @exercise.user_id
      respond_to do |format|
        if @exercise.update_attributes(params[:exercise])
          format.html { redirect_to bodypart_path(bodypart_id: @exercise.bodypart_id), notice: 'Exercise was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @exercise.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_url, flash: {alert: "Must be owner to edit!"}
    end
  end

  def parttoid
    @bodyparts = BodyPart.where(name: params[:bodypart])
    if @bodyparts.length > 0
      render json: @bodyparts.first.id
    else
      #render json: {error: "error"}
      raise
    end
  end

  # DELETE /exercises/1
  # DELETE /exercises/1.json
  def destroy
    @exercise = Exercise.find(params[:id])
    if current_user.id == @exercise.user_id
      @exercise.destroy
    respond_to do |format|
      format.html { redirect_to exercises_url }
      format.json { head :no_content }
    end
    end
  end
end
