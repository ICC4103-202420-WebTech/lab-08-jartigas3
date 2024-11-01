class TrainingSessionsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_training_session, only: [:show, :edit, :update, :destroy]
  
    def index
      @training_sessions = current_user.training_sessions
    end
  
    def show
    end
  
    def new
      @training_session = current_user.training_sessions.new
    end
  
    def create
      @training_session = current_user.training_sessions.new(training_session_params)
      if @training_session.save
        redirect_to training_sessions_path, notice: 'Training session created successfully.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @training_session.update(training_session_params)
        redirect_to training_sessions_path, notice: 'Training session updated successfully.'
      else
        render :edit
      end
    end
  
    def destroy
      @training_session.destroy
      redirect_to training_sessions_path, notice: 'Training session deleted successfully.'
    end
  
    private
  
    def set_training_session
      @training_session = current_user.training_sessions.find_by(id: params[:id])
      redirect_to training_sessions_path, alert: "You don't have permission to access this session." if @training_session.nil?
    end
  
    def training_session_params
      params.require(:training_session).permit(:date, :activity, :duration, :description)
    end
  end
  