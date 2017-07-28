class NotesController < ApplicationController
  before_filter do
    @customer = Customer.find(params[:customer_id])
  end

  def index
    @notes = @customer.notes

    respond_to do |format|
      format.html
      format.json { render json: @notes }
    end
  end

  def show
    @note = @customer.notes.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @note }
    end
  end

  def new
    @note = @customer.notes.build

    respond_to do |format|
      format.html
      format.json { render json: @note }
    end
  end

  def edit
    @note = @customer.notes.find(params[:id])
  end

  def create
    @note = @customer.notes.build(params[:note])

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note.customer, notice: 'Note was successfully created.' }
        format.json { render json: @note, status: :created, location: @note }
      else
        format.html { render action: "new" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @note = @customer.notes.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to [@note.customer, @note], notice: 'Note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note = @customer.notes.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.js   { }
      format.html { redirect_to @customer }
      format.json { head :no_content }
    end
  end
end
