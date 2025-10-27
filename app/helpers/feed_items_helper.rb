module FeedItemsHelper
  def format_feed_content(content)
    return '<p>Sem descrição disponível.</p>'.html_safe if content.blank?

    if content.match?(/<[^>]+>/)
      sanitized = sanitize(content, 
        tags: %w[p br a strong em b i ul ol li blockquote img h1 h2 h3 h4 h5 h6 pre code div span],
        attributes: %w[href src alt title class]
      )

      if !sanitized.include?('<p>') && sanitized.length > 500
        sanitized = auto_paragraph(sanitized)
      end

      return sanitized.html_safe
    end

    auto_paragraph(content).html_safe
  end

  private

  def auto_paragraph(text)
    text = text.strip.gsub(/\s+/, ' ').gsub(/<[^>]*>\s*<\/[^>]*>/, '')

    sentences = text.split(/\.\s+(?=[A-Z])/)

    paragraphs = []
    current_paragraph = []

    sentences.each_with_index do |sentence, index|
      next if sentence.strip.length < 10

      current_paragraph << sentence.strip

      if current_paragraph.length >= 3 || current_paragraph.join('. ').length > 450
        paragraphs << "<p>#{current_paragraph.join('. ')}.</p>"
        current_paragraph = []
      end
    end

    if current_paragraph.any?
      paragraphs << "<p>#{current_paragraph.join('. ')}.</p>"
    end

    paragraphs.join("\n")
  end
end
