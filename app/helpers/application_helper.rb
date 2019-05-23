module ApplicationHelper
    def avatar_for(user)
        @avatar = user.avatar
        if @avatar.nil?
            @avatar_user = image_tag("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png")
        else
            if !@avatar.url
                @avatar_user = image_tag("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png")
            else
                @avatar_user = image_tag(@avatar.url)
            end
        end
    end
end
