require 'nokogiri'
doc = Nokogiri::XML(File.read('view.xml'))
xslt = Nokogiri::XSLT(File.read('view.xsl'))
puts xslt.transform(doc)
