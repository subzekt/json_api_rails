class ContentParser
  require 'open-uri'
  attr_accessor :url
  def initialize(params={})
    @url = params[:url]
  end

  def get_contents
    doc = Nokogiri::HTML(open(url))
    contents = []
    contents += header_contents(doc)
    contents += link_contents(doc)
    contents
  end

  def link_contents(doc)
    doc.xpath('//a[@href]').map { |link| { content_type: 'link', value: link['href']}}
  end

  def header_contents(doc)
    contents = []
    %w(h1 h2 h3).each do |headings|
      matching_values = doc.xpath("//#{headings}").map{|match| match.text}.uniq
      contents += matching_values.map{ |value| { content_type: headings, value: value }}
    end
    contents
  end
end