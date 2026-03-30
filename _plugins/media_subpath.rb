Jekyll::Hooks.register :posts, :post_render do |post|
  next unless post.data['media_subpath']

  base = post.data['media_subpath'].chomp('/')

  # Rewrite src="relative.jpg" → src="/base/relative.jpg"
  # Leave alone anything that already starts with http/https/ftp or /
  post.output = post.output.gsub(/src="(?!https?:\/\/|ftp:\/\/|\/)([^"]+)"/) do
    "src=\"#{base}/#{$1}\""
  end
end
