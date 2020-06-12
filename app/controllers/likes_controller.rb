class LikesController < ApplicationController
    before_action :authenticate_user

    def create
        @like = Like.new(
            user_id: @current_user.id,
            post_id: params[:post_id]
        )
        @like.save
        @post = Post.find_by(id:params[:post_id])
        @subject = Subject.find_by(id:@post.subject_id)
        redirect_to("/posts/index/#{@subject.department_id}/#{@subject.semester_id}/#{@subject.id}")
    end
    
    def destroy
        @like = Like.find_by(user_id: @current_user.id, post_id: params[:post_id])
        @like.destroy
        @post = Post.find_by(id:params[:post_id])
        @subject = Subject.find_by(id:@post.subject_id)
        redirect_to("/posts/index/#{@subject.department_id}/#{@subject.semester_id}/#{@subject.id}")
    end

end