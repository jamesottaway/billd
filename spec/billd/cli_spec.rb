require 'spec_helper'

describe Billd::Cli do
	let(:uri) { '//build/status' }
	let(:build_output) { 'i am a build' }
	let(:parser) { mock 'Parser' }
	let(:argv) { [uri] }
	let(:build) { mock 'Build', :to_s => build_output }

	before { Billd::Parser.should_receive(:new).and_return(parser) }
	before { parser.should_receive(:parse).with(uri).and_return([build]) }
	before { STDOUT.should_receive(:puts).with(build_output) }

	it { Billd::Cli.new(argv).execute }
end