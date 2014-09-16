#____________________________________________________________________
# File: data_grabber.rb
#____________________________________________________________________
#
# Author: Shaun Ashby <shaun@ashby.ch>
# Created: 2014-09-09 22:10:59+0200
# Revision: $Id$
# Description: Module for a collection of data-manipulation classes.
#
# Copyright (C) 2014 Shaun Ashby
#
#
#--------------------------------------------------------------------
require "data_grabber/version"

module DataGrabber
  DATA_INCOMING_PATH = File.dirname(__FILE__) + "/../data/incoming"

  class SimpleCSVReader

    def initialize(file)
      @file=DATA_INCOMING_PATH + "/#{file}"
    end

    def read
      puts "Going to read CSV file #{@file}\n"
    end
  end

  class SimpleEmailParser
    require 'mail'

    def initialize(file)
      @file = DATA_INCOMING_PATH + "/#{file}"
      @messages = Array::new
    end

    def parse(debug=false)
      msg = nil

      # Open and split into individual mails:
      File.open(@file,'r') do |f|
        while (line = f.gets)
          begin
            if (line.match(/\AFrom /))
              # Save the email message so they can be accessed externally:
              @messages << Mail.new(msg) if (msg)
              msg = ''
            else
              msg << line.sub(/^\>From/, 'From')
            end
          rescue => err
            puts "Error: ###### ===> #{line}" if debug
            puts "Error: #{err}...." if debug
          end
        end
      end
    end

    attr_accessor :messages

  end

end
