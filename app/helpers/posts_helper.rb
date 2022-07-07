module PostsHelper
  def is_owner(post)
    if !current_user
      return false
    else
      return post.user_id == current_user.id
    end
  end
end
