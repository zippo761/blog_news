module CommentsHelper
  def is_owner(comment)
    if !current_user
      return false
    else
      return comment.user_id == current_user.id
    end
  end
end

