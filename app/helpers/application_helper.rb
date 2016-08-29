module ApplicationHelper
  def error_messages_for(model=nil)
    unless model.blank?
      render 'error_messages', model: model
    end
  end
end
