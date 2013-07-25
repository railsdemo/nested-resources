class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_filter :load_notepad, only: [:index, :create, :new]

  # GET
  def index
    @notes = @notepad.notes

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notes }
    end
  end

  # GET
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @note }
    end
  end

  # GET
  def new
    @note = @notepad.notes.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @note }
    end
  end

  # GET
  def edit
  end

  # POST
  def create
    @note = @notepad.notes.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render json: @note, status: :created, location: @note }
      else
        format.html { render action: "new" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT
  def update
    respond_to do |format|
      if @note.update_attributes(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE
  def destroy
    @note.destroy

    respond_to do |format|
      format.html { redirect_to notepad_notes_url(@note.notepad_id) }
      format.json { head :no_content }
    end
  end

  
  private
  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:name, :text, :notepad_id)
  end

  def load_notepad
      @notepad = Notepad.find_by_id(params[:notepad_id])
  end
end
