module Billd
	class Cli
		def initialize args
			@uri = args.shift
		end

		def execute
			builds = Billd::Parser.new.parse(@uri)
			puts builds.map { |build| build.to_s }.join "\n"
		end
	end
end