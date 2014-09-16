#!/usr/bin/env ruby
#____________________________________________________________________
# File: generate-job-stats-for-d3.rb
#____________________________________________________________________
#
# Author: Shaun Ashby <shaun@ashby.ch>
# Created: 2014-09-15 23:51:39+0200
# Revision: $Id$
# Description: A script to read an mbox file and generate a CSV for d3.js.
#
# Copyright (C) 2014 Shaun Ashby
#
#
#--------------------------------------------------------------------
$:.unshift File.expand_path("../lib", __FILE__)

require 'data_grabber'

# Input file coming from activity log:
input = "jobs.mbox"
# Create a parser and parse the input mbox file:
mbx = DataGrabber::SimpleEmailParser.new(input)
mbx.parse
# Loop over messages, extract subject then match to
# extract number of posts and a search filter (if one
# was applied to get the results):
mbx.messages.each do |msg|

  subj = msg.subject
  date = msg.date

  if m = /^[jJ]ob.*?- (\d+).+criteria\.$/.match(subj)
    printf("M1:%d\n", m[1]) if $DEBUG
    printf("%s,%d\n", date, m[1])
  elsif m = /(\d+) .*JobMailer \"(.*?)\"\./.match(subj)
    printf("M2: %d  %s\n", m[1], m[2]) if $DEBUG
    printf("%s,%d,%s\n", date, m[1], m[2])
  elsif m = /(\d+) .*JobMailer \'(.*?)\'\./.match(subj)
    printf("M3: %d  %s\n", m[1], m[2]) if $DEBUG
    printf("%s,%d,%s\n", date, m[1], m[2])
  elsif m = /(\d+) .*search \"(.*?)\"\.?/.match(subj)
    printf("M4: %d  %s\n", m[1], m[2]) if $DEBUG
    printf("%s,%d,%s\n", date, m[1], m[2])
  else
    printf("unmatched: %s\n", subj) if $DEBUG
  end

end
