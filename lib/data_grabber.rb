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

end
