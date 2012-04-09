require 'billd/parser'

module Billd
	class Cli
		def self.execute args
			uri = args.shift
			builds = Billd::Parser.parse(uri)
			puts builds.map { |build| build.to_s }.join "\n"
		end
	end
end