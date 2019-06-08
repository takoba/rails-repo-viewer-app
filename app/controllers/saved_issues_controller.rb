class SavedIssuesController < ApplicationController
  include ActionController::RequestForgeryProtection
  protect_from_forgery with: :exception, unless: -> { request.format.json? }

  before_action :set_saved_issue, only: [:show, :edit, :update, :destroy]

  # GET /saved_issues
  # GET /saved_issues.json
  def index
    @saved_issues = SavedIssue.all
  end

  # GET /saved_issues/1
  # GET /saved_issues/1.json
  def show
  end

  # GET /saved_issues/new
  def new
    @saved_issue = SavedIssue.new
  end

  # GET /saved_issues/1/edit
  def edit
  end

  # POST /saved_issues
  # POST /saved_issues.json
  def create
    @saved_issue = SavedIssue.new(saved_issue_params)

    respond_to do |format|
      if @saved_issue.save
        format.html { redirect_to @saved_issue, notice: 'Saved issue was successfully created.' }
        format.json { render :show, status: :created, location: @saved_issue }
      else
        format.html { render :new }
        format.json { render json: @saved_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /saved_issues/1
  # PATCH/PUT /saved_issues/1.json
  def update
    respond_to do |format|
      if @saved_issue.update(saved_issue_params)
        format.html { redirect_to @saved_issue, notice: 'Saved issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @saved_issue }
      else
        format.html { render :edit }
        format.json { render json: @saved_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saved_issues/1
  # DELETE /saved_issues/1.json
  def destroy
    @saved_issue.destroy
    respond_to do |format|
      format.html { redirect_to saved_issues_url, notice: 'Saved issue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saved_issue
      @saved_issue = SavedIssue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def saved_issue_params
      params.require(:saved_issue).permit(:user_name, :repo_name)
    end
end
