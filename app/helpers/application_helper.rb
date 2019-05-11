module ApplicationHelper
  
  # Returns the full title on a per-page basis
  def full_title(page_title = '')
    base_title = 'Ruby on Rails Tutorial Sample App'
    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end
  
  def tag_cloud(tags, classes)
    max = tags.max_by(&:count)
    tags.each do |tag|
      index = tag.count.to_f / max.count * (classes.size - 1)
      yield(tag, classes[index.round])
    end
  end
  
end
