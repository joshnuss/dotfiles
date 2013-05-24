
Numeric.class_eval do
  def to_h
    sprintf("0x%X", self)
  end

  def to_b
    sprintf("0b%b", self)
  end
end

require 'irb/completion'
require 'rubygems'
require 'wirble'
require 'hirb'

if defined?(ActiveRecord)
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end

IRB.conf[:PROMPT_MODE] = :SIMPLE

Wirble.init
Wirble.colorize
Hirb.enable

