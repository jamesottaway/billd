require 'billd/status'

module Billd
	class Cli
		def self.execute args
			uri = args.shift
			status = Billd::Status.new(uri)
			STDOUT.puts status.builds.map { |build| build.to_s }.join "\n"
		end
	end
end