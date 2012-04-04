require 'spec_helper'

describe BuildP::Build do
	subject { BuildP::Build.new(status) }
	let(:status) { %Q{<Project name="my-project" lastBuildStatus="Success"/>} }

	its(:name) { should == 'my-project' }
	its(:to_s) { should == 'my-project: Success!' }

	describe 'passing' do
		let(:status) { %Q{<Project name="my-project" lastBuildStatus="Success" activity="Sleeping"/>} }
		its(:outcome) { should == :success }
	end

	describe 'failing' do
		let(:status) { %Q{<Project name="my-project" lastBuildStatus="Failure" activity="Sleeping"/>} }
		its(:outcome) { should == :failure }
	end

	describe 'building from success' do
		let(:status) { %Q{<Project name="my-project" lastBuildStatus="Success" activity="Building"/>} }
		its(:outcome) { should == :building }
	end

	describe 'building from failure' do
		let(:status) { %Q{<Project name="my-project" lastBuildStatus="Failure" activity="Building"/>} }
		its(:outcome) { should == :building }
	end
end