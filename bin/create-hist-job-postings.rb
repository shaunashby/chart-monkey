#!/usr/bin/env ruby
#____________________________________________________________________
# File: create-hist-job-postings.rb
#____________________________________________________________________
#
# Author: Shaun Ashby <shaun@ashby.ch>
# Created: 2014-09-09 22:27:19+0200
# Revision: $Id$
# Description: A script to exercise the data manipulation classes.
#
# Copyright (C) 2014 Shaun Ashby
#
#
#--------------------------------------------------------------------
$:.unshift File.expand_path("../../lib", __FILE__)

require 'data_grabber'

csv = DataGrabber::SimpleCSVReader.new("test.csv")

csv.read
