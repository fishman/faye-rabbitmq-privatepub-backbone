#!/usr/bin/env ruby
# encoding: utf-8

require "rubygems"
require 'bunny'

client = ::Bunny.new('amqp://localhost')
client.start
exchange = client.exchange('')
exchange.publish("2", :key => "amqp.conf_messages.participants.leave")
