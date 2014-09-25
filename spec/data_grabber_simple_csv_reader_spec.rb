#!/usr/bin/env ruby
#____________________________________________________________________
# File: data_grabber_simple_csv_reader_spec.rb
#____________________________________________________________________
#
# Author: Shaun Ashby <shaun@ashby.ch>
# Created: 2014-09-25 15:22:56+0200
# Revision: $Id$
# Description: Spec for the DataGrabber::SimpleCSVReader class.
#
# Copyright (C) 2014 Shaun Ashby
#
#
#--------------------------------------------------------------------
require "data_grabber"

describe DataGrabber::SimpleCSVReader do

  it "should instantiate with CSV file argument" do
    expect(DataGrabber::SimpleCSVReader.new("test.csv")).to be_an_instance_of(DataGrabber::SimpleCSVReader)
  end

end
