#!/usr/bin/env ruby
#____________________________________________________________________
# File: data_grabber_simple_email_parser_spec.rb
#____________________________________________________________________
#
# Author: Shaun Ashby <shaun@ashby.ch>
# Created: 2014-09-25 15:20:59+0200
# Revision: $Id$
# Description: Spec for DataGrabber::SimpleEmailParser class.
#
# Copyright (C) 2014 Shaun Ashby
#
#
#--------------------------------------------------------------------
require "data_grabber"

describe DataGrabber::SimpleEmailParser do

  it "should instantiate with mbox file argument" do
    expect(DataGrabber::SimpleEmailParser.new("jobs.mbox")).to be_an_instance_of(DataGrabber::SimpleEmailParser)
  end

  # it "should return the id" do
  #   expect(@criteria.id).to eq(354346)
  # end

  # it "should return the description" do
  #   expect(@criteria.description).to eq("System Admin UNIX/Linux")
  # end

  # it "should return the info string for the search criteria" do
  #   expect(@criteria.info).to match(/Configured search ID 354346/)
  # end

end
