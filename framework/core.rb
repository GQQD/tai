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
	#ָ��ɨ��ű�
	if script = options[:script]
		puts "script: #{script}"
	end
	#ָ��ɨ�����
	if rule = options[:rule]
		puts "rule: #{rule}"
	end
	#ָ��ɨ��Ŀ��
	if target = options[:target]
		whole_scan( target )
		#get_info( target, 80 )
	end
	#����ɨ������
	if import = options[:import]
		puts "import:#{import}"
	end
	#����ɨ������
	if export = options[:export]
		puts "export #{export}"
	end
	#��ɨ����������ļ�
	if output = options[:output]
		puts "output: #{output}"
	end
	#��ʾ����
	if list = options[:list]
		puts "list: #{list}"
	end
	#���¹����
	if options[:update]
		puts "updating..."
	end
	#��ʼ���������ݿ�
	if options[:init]
		puts "initialize"
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
