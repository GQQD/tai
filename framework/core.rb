#!/bin/ruby
#-*- coding:utf-8 -*-

$LOAD_PATH << File.dirname(__FILE__)

require 'config'
require 'alive'
require 'portscan'

#ɨ��ϵͳ��ʼ��
def init()
	puts "Start"
end

#����ű�����
def args_parse(options)
	if options[:target]
		#puts whole_scan( options[:target] )
		get_info( options[:target], 9999 )
	end
	#options.each do | k,v |
	#	puts "#{k}=>#{v}"
	#end
end

def parse_ip(item)
  puts item
end


#���汾�͹������
def version(obj)
	version = Hash.new
	version["framework"] = "0.0.0"
	version["rules"]	= "20160104"
	return version[obj]
end
