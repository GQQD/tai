#!/bin/ruby
#-*- coding:utf-8 -*-

$LOAD_PATH << File.dirname(__FILE__)

require 'config'
require 'alive'

#ɨ��ϵͳ��ʼ��
def init()
	puts "Start"
end

#����ű�����
def args_parse(options)
	options.each do | k,v |
		puts "#{k}=>#{v}"
	end
end



#���汾�͹������
def version(obj)
	version = Hash.new
	version["framework"] = "0.0.0"
	version["rules"]	= "20160104"
	return version[obj]
end
