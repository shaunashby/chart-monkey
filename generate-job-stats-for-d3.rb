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

collections=Hash::new()

# Input file coming from activity log:
input = "jobs.mbox"
# Create a parser and parse the input mbox file:
mbx = DataGrabber::SimpleEmailParser.new(input)
mbx.parse
# Loop over messages, extract subject then match to
# extract number of posts and a search filter (if one
# was applied to get the results):
skipped = 0
mbx.messages.each do |msg|

  subj = msg.subject
  date = msg.date

  if m = /^[jJ]ob.*?- (\d+).+criteria\.$/.match(subj)
    printf("M1: \"%s\",\"%d\"\n", date.strftime("%d/%m/%y %H:%M:%S"), m[1]) if $DEBUG

    if !collections.has_key?("M1")
      collections["M1"] = Array::new()
    end

    collections["M1"] << sprintf("\"%s\",\"%d\"\n", date.strftime("%d/%m/%y %H:%M:%S"), m[1])
  elsif m = /(\d+) .*JobMailer \"(.*?)\"\./.match(subj)
    printf("\"%s\",\"%d\",\"%s\"\n", date.strftime("%d/%m/%y %H:%M:%S"), m[1], m[2]) if $DEBUG

    if !collections.has_key?("M2")
      collections["M2"] = Array::new()
    end

    collections["M2"] << sprintf("\"%s\",\"%d\",\"%s\"\n", date.strftime("%d/%m/%y %H:%M:%S"), m[1], m[2])
  elsif m = /(\d+) .*JobMailer \'(.*?)\'\./.match(subj)
    printf("\"%s\",\"%d\",\"%s\"\n", date.strftime("%d/%m/%y %H:%M:%S"), m[1], m[2]) if $DEBUG

    if !collections.has_key?("M3")
      collections["M3"] = Array::new()
    end

    collections["M3"] << sprintf("\"%s\",\"%d\",\"%s\"\n", date.strftime("%d/%m/%y %H:%M:%S"), m[1], m[2])
  elsif m = /(\d+) .*search \"(.*?)\"\.?/.match(subj)
    printf("\"%s\",\"%d\",\"%s\"\n", date.strftime("%d/%m/%y %H:%M:%S"), m[1], m[2]) if $DEBUG

    if !collections.has_key?("M4")
      collections["M4"] = Array::new()
    end

    collections["M4"] << sprintf("\"%s\",\"%d\",\"%s\"\n", date.strftime("%d/%m/%y %H:%M:%S"), m[1], m[2])
  else
    printf("unmatched: %s\n", subj) if $DEBUG
    skipped += 1
  end

end

puts "Parsed #{mbx.messages.length} messages (skipped #{skipped})." if $DEBUG
