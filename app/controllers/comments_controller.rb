class CommentsController < ApplicationController
    http_basic_authenticate_with name: "mjkim", password: "1234",
    only :destroy

    def create
        @ranking = Ranking.find(params[:ranking_id])
        @comment = @ranking.comments.create(comment_params)
        redirect_to ranking_path(@ranking)
    end
    def destroy
        @ranking = Ranking.find(params[:ranking_id])
        @comment = @ranking.comments.find(params[:id])
        @comment.destroy
        redirect_to ranking_path(@ranking)
    end

    private
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end
end
