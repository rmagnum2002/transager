class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  # GET /feedbacks
  # GET /feedbacks.json
  # def index
  #   @feedbacks = Feedback.all
  # end

  # GET /feedbacks/1
  # GET /feedbacks/1.json
  # def show
  # end

  # GET /feedbacks/new
  def new
    @feedback = Feedback.new
  end

  # GET /feedbacks/1/edit
  # def edit
  # end

  # POST /feedbacks
  # POST /feedbacks.json
  def create
    @feedback = Feedback.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to contacts_path, notice: t('notices.feedback_sent') }
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { render 'contacts/index' }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feedback_params
      params[:feedback].permit!
    end
end
