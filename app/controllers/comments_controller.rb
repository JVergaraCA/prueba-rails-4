class CommentsController < ApplicationController
	  before_action :set_comment, only: [:destroy]


  def create
  	 @enterprise = Enterprise.find(params[:post_id])  	
  	 @comment = @enterprise.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @enterprise }
        format.js
      else
        format.html { render :new }
        format.json { render json: @enterprise.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :enterprise_id)
    end
end
