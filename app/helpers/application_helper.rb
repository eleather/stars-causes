module ApplicationHelper
  def second_button(star)
    if current_user.can_second?(star)
      link_to 'Second', star_seconds_url(star), :class => 'second',
        'data-remote' => true, 'data-replace-id' => "star_#{star.id}",
        'data-method' => 'post'
    end
  end

  FRIENDLY_TIME_FORMAT = '%b %d at %I:%M%p'
  def friendly_time(time)
    time.getlocal.strftime(FRIENDLY_TIME_FORMAT).
         gsub(/(\s|^)0/, '\\1').
         sub('AM', 'am').
         sub('PM', 'pm')
  end

  def photo(user)
    if user.facebook_uid
      fb_uid = user.facebook_uid.to_i
      image_url = "http://graph.facebook.com/#{fb_uid}/picture?type=square"
      image_tag = image_tag(
        image_url, 
        :class => 'user_photo', 
        :alt => '',
        :title => user.name
      )
    else
      image_tag = image_tag(
        'user.png',
        :class => 'user_photo', 
        :alt => '',
        :title => user.name
      )
    end
      
    link_to image_tag, user_url(user)
  end

  def background_photo(user)
    image_url =
      "http://graph.facebook.com/#{user.facebook_uid.to_i}/picture?type=large"
    div = content_tag(:div, '', :class => 'user_photo', :title => user.name,
                      :style => "background-image: url('#{image_url}');" +
                        'background-position: center; background-size: cover')
    link_to div, user_path(user)
  end
end
