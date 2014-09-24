#!/usr/bin/env ruby
#____________________________________________________________________
# File: data_grabber_spec.rb
#____________________________________________________________________
#
# Author: Shaun Ashby <shaun@ashby.ch>
# Created: 2014-09-24 22:27:06+0200
# Revision: $Id$
# Description: Spec test for the data grabber utils.
#
# Copyright (C) 2014 Shaun Ashby
#
#
#--------------------------------------------------------------------
require "data_grabber"

describe DataGrabber do

  it "should instantiate with mbox file argument" do
    expect(DataGrabber::SimpleEmailParser.new("jobs.mbox")).to be_an_instance_of(DataGrabber::SimpleEmailParser)
  end

end
