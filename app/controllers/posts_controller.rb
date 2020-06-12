class PostsController < ApplicationController

  before_action:authenticate_user,{only:[:create,:show]}
  before_action:ensure_correct_user,{only:[:edit,:update,:destroy]}

  
  def index
  end

  def department
    
    @department_id = params[:department_id]
  end


  def semester
    @subjects = Subject.where(department_id:params[:department_id] ,semester_id:params[:semester_id])
  end
  

  def subject
    @subject = Subject.find_by(id:params[:id])
    @posts =Post.where(subject_id:@subject.id).order(created_at: :desc)
    @post = Post.new
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @likes_count = Like.where(post_id:@post.id).count
  end


  def create
    @subject = Subject.find_by(id:params[:id])
    @post = Post.new(content: params[:content],user_id: @current_user.id,subject_id:@subject.id)   
    if @post.save
      flash[:notice]="投稿を作成しました"
      redirect_to("/posts/index/#{@subject.department_id}/#{@subject.semester_id}/#{@subject.id}")
    else
      redirect_to("/posts/index/#{@subject.department_id}/#{@subject.semester_id}/#{@subject.id}")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    @subject = Subject.find_by(id:@post.subject_id)
    if @post.save
      flash[:notice]="投稿を編集しました"
      redirect_to("/posts/index/#{@subject.department_id}/#{@subject.semester_id}/#{@subject.id}")
    else
      render("/posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @likes = Like.destroy_by(post_id:@post.id)
    @subject = Subject.find_by(id:@post.subject_id)
    @post.destroy
    
    flash[:notice]="投稿を削除しました"
    redirect_to("/posts/index/#{@subject.department_id}/#{@subject.semester_id}/#{@subject.id}")

  end

  def ensure_correct_user
    @post = Post.find_by(id:params[:id])
    if @post.user_id != @current_user.id
      flash[:notice]="権限がありません"
      redirect_to("/posts/index")
    end
  end

  
  
end
