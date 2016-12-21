module UsersHelper
  def redner_with_hashtags(about)
    body.gsub(/#\w+/){|word| link_to word, "/profiles/hashtag/#{word.delete('#')}"}.html_safe
  end
end
