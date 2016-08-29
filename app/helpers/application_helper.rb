module ApplicationHelper
  def error_messages_for(model=nil)
    unless model.blank?
      render 'error_messages', model: model
    end
  end

  def markdown(text)
    @render_extensions ||= {
      hard_wrap: true,
      filter_html: true,
      safe_links_only: true,
      fenced_code_blocks: true,
      link_attributes: {
        rel: 'nofollow',
        target: "_blank"
      },
      lax_spacing: true,
      autolink: true,
      strikethrough: true,
      tables: true,
      highlight: true,
      underline: true,
      no_intra_emphasis: true,
      disable_indented_code_blocks: true
    }

    @md ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, @render_extensions)
    html = @md.render(text).html_safe

    content_tag(:div, html, class: "markdown")

  end
end
