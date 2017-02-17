# frozen_string_literal: true

class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :update, :destroy]

  # GET /entries
  def index
    @entries = Entry.all

    render json: @entries
  end

  # GET /entries/1
  def show
    render json: @entry
  end

  # POST /entries
  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      render json: @entry, status: :created
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /entries/1
  def update
    if @entry.update(entry_params)
      head :no_content
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  # DELETE /entries/1
  def destroy
    @entry.destroy
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_entry
    @entry = Entry.find(params[:id])
  end
  private :set_entry

  # Only allow a trusted parameter "white list" through.
  def entry_params
    params.require(:entry).permit(:list, :reader_id, :book_id)
  end
  private :entry_params
end
