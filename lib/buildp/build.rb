require 'nokogiri'

module BuildP
	class Build
		def initialize status
			@status = status
		end

		def name
			Nokogiri.parse(@status).children.attribute('name').value
		end

		def outcome
			outcome = :success
			outcome = :failure if @status[%Q{lastBuildStatus="Failure"}]
			outcome = :building if @status[%Q{activity="Building"}]
			outcome
		end

		def to_s
			"#{name}: #{outcome.to_s.capitalize}!"
		end
	end
end