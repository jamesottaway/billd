require 'nokogiri'

module BuildP
	class Parser
		def parse uri
			source = Kernel.open(uri).read
			xml = Nokogiri.parse source
			projects = xml.elements.first
			projects.elements.map { |e|
				BuildP::Build.new(e.to_xml)
			}
		end
	end
end