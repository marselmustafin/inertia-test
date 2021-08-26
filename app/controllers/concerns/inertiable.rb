
module Inertiable
  extend ActiveSupport::Concern

  included do
    before_action :inertiable
  end

  def inertiable
    response.set_header('Vary', 'Accept')
    response.set_header('X-Inertia', true) if inertiable?
  end

  def inertiable?
    request.headers['X-Inertia'].present?
  end

  def inertia(component, props = {})
    props = @shared_props.merge(props) if @shared_props
    component_name = component.to_s.camelize.gsub('::', '/')

    data = {
      component: component_name,
      props: props,
      url: url(props[:errors]) || request.url
    }

    if inertiable?
      render json: data
    else
      html = helpers.tag.div(
        id: 'app',
        data: { page: data }
      )
      render html: html, layout: true
    end
  end

  private

  def url(errors)
    return if errors.blank?

    action = case params[:action]
    when 'create'
      'new'
    when 'update'
      'edit'
    else
      return nil
    end

    url_for controller: params[:controller], action: action
  rescue ActionController::UrlGenerationError
    request.url
  end
end
