module ApplicationHelper
  def avatar_for(user)
    @avatar = user.avatar
    if @avatar.nil?
      image_tag("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png")
    elsif !@avatar.url
      image_tag("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png")
    else
      # image_tag(@avatar.url)
      cl_image_tag(@avatar.url, secure: true)
    end
  end
end
