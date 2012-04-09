require 'spec_helper'
require 'billd/status'

describe Billd::Status do
	let(:uri) { '//build/status' }
	let(:successful) { mock 'successful build', :outcome => :success }
	let(:failed) { mock 'failed build', :outcome => :failure }
	let(:building) { mock 'build being built', :outcome => :building }
	let(:parsed_builds) { [successful, failed, building] }

	before { Billd::Parser.should_receive(:parse).with(uri).and_return(parsed_builds) }

	subject { Billd::Status.new(uri) }

	its(:builds) { should == parsed_builds }

	describe 'overall' do
		describe 'failure > success' do
			let(:parsed_builds) { [successful, failed] }
			its(:overall) { should == :failure }
		end

		describe 'building > failure' do
			let(:parsed_builds) { [failed, building] }
			its(:overall) { should == :building }
		end
	end
end