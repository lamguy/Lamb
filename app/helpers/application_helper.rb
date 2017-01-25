module ApplicationHelper
  def body_css_class
    @body_css_classes ||= []
    view_css_class = [controller_path.split('/'), action_name].flatten.join(' ')

    @body_css_classes.unshift(view_css_class).join(' ')
  end

  def get_count(count)
    if(!count)
      0
    else
      count
    end
  end
end
