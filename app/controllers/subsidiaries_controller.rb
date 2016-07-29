class SubsidiariesController < ApplicationController

  # GET /feedbacks
  # GET /feedbacks.json
  def index
    @subsidiaries = Subsidiary.all.order('position asc')
  end

  def show
    @subsidiary = Subsidiary.find(params[:id])
  end

  # GET /feedbacks/1
  # GET /feedbacks/1.json
  # def show
  # end

  # GET /feedbacks/new


  private
  # Use callbacks to share common setup or constraints between actions.
  def find_subsidiary
    @subsidiary = Subsidiary.find(params[:id])
  end
end
