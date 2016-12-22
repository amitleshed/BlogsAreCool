module WelcomeHelper
    def redner_with_hashtags_welcome(about)
    about.gsub(/#\w+/){|word| link_to word, "/profiles/hashtag/#{word.delete('#')}"}.html_safe
  end
end
