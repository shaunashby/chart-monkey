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

  subj = mail.subject
  date = mail.date

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

# Input file coming from activity log:
input = File.dirname(__FILE__) + "/data/incoming/jobs.mbox"
messages=[]
msg = nil

# Open and split into individual mails, extract subject then match to
# extract number of posts and a search filter (if one was applied to
# get the results):
File.open(input,'r') do |f|
  while (line = f.gets)
    begin
      if (line.match(/\AFrom /))
        get_data_from_msg(msg) if (msg)
        msg = ''
      else
        msg << line.sub(/^\>From/, 'From')
      end
    rescue => err
      puts "###### ===> XX#{line}XX"  if $DEBUG
      puts "Error: #{err}...." if $DEBUG
    end
  end
end
