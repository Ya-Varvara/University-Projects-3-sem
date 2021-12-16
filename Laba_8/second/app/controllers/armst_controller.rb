
require 'nokogiri'
require 'open-uri'

class ArmstController < ApplicationController
  before_action :receive_params
  def input; end

  def view
    api_response = URI.open("http://localhost:3000/?v1=#{@value}&format=xml")
    case @side
    when 'server'
      @result = xslt_transform(api_response).to_html
    when 'client-with-xslt'
      render xml: browser_xslt(api_response)
    else
      render xml: api_response
    end
  end

  def receive_params
    @side = params[:side]
    @value = params[:v1]
  end

  XSLT_SERVER_TRANSFORM = "#{Rails.root}/public/server_transform.xslt".freeze

  def xslt_transform(response, transform: XSLT_SERVER_TRANSFORM)
    doc = Nokogiri::XML(response)
    xslt = Nokogiri::XSLT(File.read(transform))
    xslt.transform(doc)
  end

  def browser_xslt(response)
    response.string.sub('?>', '?><?xml-stylesheet type="text/xsl" href="/browser_transform.xslt"?>')
  end

end

