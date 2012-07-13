# billd [![Build Status](https://secure.travis-ci.org/jamesottaway/billd.png)](http://travis-ci.org/jamesottaway/billd)

get to know your build

### What

`billd` is a gem used to parse and understand the status of your build. It hopes to be the foundation of many cool Ruby apps which leverage build status information in many weird and wonderful ways.

If you use `billd` to make something even remotely interesting, please show me and I will be eternally grateful. To see an example of `billd` being used by another library, please refer to [blinky_billd](https://github.com/jamesottaway/blinky_billd).

### How

First, you need a build server which talks the same language as `billd`. Currently, the only option is the CruiseControl format, but this style if supported by Jenkins, Go and a few other tools, in addition to CruiseControl.

    ~  ᐅ curl http://build/status.xml
    
    <Projects>
      <Project name="successful-project" lastBuildStatus="Success" activity="Sleeping"/>
      <Project name="building-from-success-project" lastBuildStatus="Success" activity="Building"/>
      <Project name="building-from-failure-project" lastBuildStatus="Failure" activity="Building"/>
      <Project name="failed-project" lastBuildStatus="Failure" activity="Sleeping"/>
    </Projects>

If we then give this URL to `billd`, we'll find ourselves very well informed.

    ~  ᐅ billd http://build/status.xml
    
    successful-project: Success!
    building-from-success-project: Building!
    building-from-failure-project: Building!
    failed-project: Failure!

But that only helps from your shell of choice. What about in your Ruby project?

First, add `billd` to your `Gemfile`:

    source 'https://rubygems.org'
    
    # ...
    gem 'billd'
    # ...

Or add `billd` to your gemspec:

    Gem::Specification.new do |gem|
      # ...
      gem.add_runtime_dependency 'billd'
      #...
    end

Or just go crazy and install it directly:

    ~  ᐅ gem install billd

You're now ready to rock and/or roll:

    require 'billd/status'

    status = Billd::Status.new 'http://build/status.xml'
      # => #<Billd::Status:0x007f83923e01f8 @builds=[...]>

    status.builds.each { |build| puts build }
      # => successful-project: Success!
      # => building-from-success-project: Building!
      # => building-from-failure-project: Building!
      # => failed-project: Failure!

    status.builds.first.name
      # => "successful-project"

    status.builds.first.outcome
      # => :success!

    status.overall
      # => :building!

If there is more information in your CI server's XML feed which you want to access, please fork and contribute!

### Why

The only tools I've ever found to help me parse the status of a build server's XML feed focused on monitoring and notification, with parsing the XML feed as simply a means to an end. These tools are great if you want to receive emails or other alerts when your build status changes, but don't give you access to the underlying data.

There are so many different things you may want to use your build status data for, I decided that it needed to be exposed. Enter `billd`, your friendly build status parser.

### Who

Developed by James Ottaway.

Name courtesy of Mark Ryall.

### Contributing

Patches and features are very welcome. Anything to help make `billd` a better tool for parsing and integrating with build server outputs is welcome.

Features I may add in the future:

* Support for other build status formats (Travis, TeamCity, Bamboo, etc.)
* Remove dependency on Nokogiri
* Support for other elements in the CruiseControl output format
* Read arguments from a file rather than STDIN

### Meta

The build for `billd` runs on Travis, which `billd` ironically cannot parse. See the [`billd` build](http://travis-ci.org/jamesottaway/billd) or [`.travis.yml`](https://github.com/jamesottaway/billd/blob/master/.travis.yml) for more info.
