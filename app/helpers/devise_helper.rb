module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t('errors.messages.not_saved',
    count: resource.errors.count,
    resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div class="alert alert-warning alert-dismissable">
      <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      <ul class="list-unstyled">
        #{sentence}
        #{messages}
      </ul>
    </div>
    HTML
    html.html_safe
 end
end
