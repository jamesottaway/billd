require 'billd/parser'

module Billd
	class Status
		attr_reader :builds

		def initialize uri
			@builds = Billd::Parser.parse(uri)
		end

		def overall
			result = :success
			result = :failure if @builds.any? { |b| b.outcome == :failure }
			result = :building if @builds.any? { |b| b.outcome == :building }
			result
		end
	end
end