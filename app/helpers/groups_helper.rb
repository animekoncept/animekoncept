module GroupsHelper

  def joined_user
    if @group.marked_as_join? by: current_user
      render partial: "comments/template", locals: {commentable: @group, new_comment: @comment} if user_signed_in?
    else
    end
  end
end
