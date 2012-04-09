require 'nokogiri'

module Billd
	class Parser
		def self.parse uri
			source = Kernel.open(uri).read
			xml = Nokogiri.parse source
			projects = xml.elements.first
			projects.elements.map { |e|
				Billd::Build.new(e.to_xml)
			}
		end
	end
end