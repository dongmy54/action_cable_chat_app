module MessagesHelper
  def html_to_markdown(text)
    Kramdown::Document.new(text, input: 'GFM').to_html
  end
end
