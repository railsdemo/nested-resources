class StatesController < ApplicationController
  before_filter :load_country, only: [:index, :create, :new]
  # GET
  def index
    @states = @country.states

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @states }
    end
  end

  # GET
  def show
    @state = State.find(params[:id])
    @cities = @state.cities

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @state }
    end
  end

  # GET
  def new
    @state = @country.states.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @state }
    end
  end

  # GET
  def edit
    @state = State.find(params[:id])
  end

  # POST
  def create
    @state = @country.states.new(params[:state])

    respond_to do |format|
      if @state.save
        format.html { redirect_to @state, notice: 'State was successfully created.' }
        format.json { render json: @state, status: :created, location: @state }
      else
        format.html { render action: "new" }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT
  def update
    @state = State.find(params[:id])

    respond_to do |format|
      if @state.update_attributes(params[:state])
        format.html { redirect_to @state, notice: 'State was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE
  def destroy
    @state = State.find(params[:id])
    @state.destroy

    respond_to do |format|
      format.html { redirect_to country_states_path(@state.country_id) }
      format.json { head :no_content }
    end
  end

  protected
  def load_country
      @country = Country.find_by_id(params[:country_id])
  end
end
