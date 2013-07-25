class NotepadsController < ApplicationController
  before_action :set_notepad, only: [:show, :edit, :update, :destroy]
  before_filter :load_user, only: [:index, :create, :new]

  # GET
  def index
    @notepads = @user.notepads

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notepads }
    end
  end

  # GET
  def show
    @notes = @notepad.notes

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @notepad }
    end
  end

  # GET
  def new
    @notepad = @user.notepads.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @notepad }
    end
  end

  # GET
  def edit
  end

  # POST
  def create
    @notepad = @user.notepads.new(notepad_params)

    respond_to do |format|
      if @notepad.save
        format.html { redirect_to @notepad, notice: 'Notepad was successfully created.' }
        format.json { render json: @notepad, status: :created, location: @notepad }
      else
        format.html { render action: "new" }
        format.json { render json: @notepad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT
  def update
    respond_to do |format|
      if @notepad.update_attributes(notepad_params)
        format.html { redirect_to @notepad, notice: 'Notepad was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @notepad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE
  def destroy
    @notepad.destroy

    respond_to do |format|
      format.html { redirect_to user_notepads_path(@notepad.user_id) }
      format.json { head :no_content }
    end
  end

  
  private
  def set_notepad
    @notepad = Notepad.find(params[:id])
  end

  def notepad_params
    params.require(:notepad).permit(:name, :user_id)
  end

  def load_user
      @user = User.find_by_id(params[:user_id])
  end
end
