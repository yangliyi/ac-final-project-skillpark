class ApiV1::CommentsController < ApiController
  def index
    @comments = Comment.all
  end
end
