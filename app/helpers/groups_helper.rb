module GroupsHelper

  def joined_user
    if @group.marked_as_join? by: current_user
      render partial: "comments/template", locals: {commentable: @group, new_comment: @comment} if user_signed_in?
    else
    end
  end

  def join_button
    if user_signed_in?
      render partial: 'join', locals: {group: @group}
    else
      link_to "Join group", new_user_session_path, class: 'leave button expanded'
    end
  end
end
