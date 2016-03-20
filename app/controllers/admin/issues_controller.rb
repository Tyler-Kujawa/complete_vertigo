class Admin::IssuesController < AdminController
	layout 'dashboard'

	before_action :set_Issue, only: [:show, :edit, :update, :destroy]
	before_filter :authorize

	def index
		@issues = Issue.all
	end

	def show
	end

	def new
		@issue = Issue.new
	end

	def edit
	end

	  # POST /Issues
  # POST /Issues.json
  def create
    @issue = Issue.new(issue_params)

    respond_to do |format|
      if @issue.save
        format.html { redirect_to admin_issue_url(@issue), notice: 'Issue was successfully created.' }
        format.json { render :show, status: :created, location: @issue }
      else
        format.html { render :new }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Issues/1
  # PATCH/PUT /Issues/1.json
  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to admin_issue_url(@issue), notice: 'Issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Issues/1
  # DELETE /Issues/1.json
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to admin_issues_url, notice: 'Issue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # PATCH/PUT /issues/1
  def remove_cover_image
    @issues = Issue.find(params[:id])
    @issues.cover_image.destroy
    @issues.cover_image = nil
    @issues.save
    redirect_to admin_issues_path(@issue)
  end


 	private
    # Use callbacks to share common setup or constraints between actions.
    def set_Issue
      @issue = Issue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:title, :user_id, :rating, :publication_date,
                                        :cover_image, :content, :issue_number, :summary)
    end
end
