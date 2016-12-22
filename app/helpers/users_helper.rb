module UsersHelper
      def redner_with_hashtags_user(about)
    about.gsub(/#\w+/){|word| link_to word, "/profiles/hashtag/#{word.delete('#')}", :id => "hashtags-user"}.html_safe
  end
end
