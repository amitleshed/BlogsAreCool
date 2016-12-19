if Rails.env.production? 
  Paperclip::Attachment.default_options[:url] = 'blogsarecool.s3.amazonaws.com'
  Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
  Paperclip::Attachment.default_options[:s3_region] = 'us-east-1'
end
