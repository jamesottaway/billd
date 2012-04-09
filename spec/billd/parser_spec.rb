require 'spec_helper'
require 'billd/parser'

describe Billd::Parser do
	let(:build1) { mock 'Build' }
	let(:build2) { mock 'Build' }
	let(:build3) { mock 'Build' }
	let(:uri) { '//build/status' }
	let(:status1) { '<Project name="project1"/>' }
	let(:status2) { '<Project name="project2"/>' }
	let(:status3) { '<Project name="project3"/>' }
	let(:statuses) { "<Projects>#{status1}#{status2}#{status3}</Projects>" }
	let(:stream) { mock 'File', :read => statuses }

	subject { Billd::Parser.parse(uri) }

	before { Kernel.should_receive(:open).with(uri).and_return(stream) }
	before { Billd::Build.should_receive(:new).with(status1).and_return(build1) }
	before { Billd::Build.should_receive(:new).with(status2).and_return(build2) }
	before { Billd::Build.should_receive(:new).with(status3).and_return(build3) }

	its(:size) { should == 3 }
	it { should == [build1, build2, build3] }
end