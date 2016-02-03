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

def args_parse(options)
	if output = options[:output]
		puts "Output To File: #{output}"
	end
	if import = options[:import]
		puts "Launch Task:#{import}"
	elsif export = options[:export]
		puts "Export Task:#{export}" #����ɨ������
	elsif list = options[:list]
		puts "list: #{list}"	#��ʾ����
	elsif options[:update]
		puts "updating..."	#���¹����
	elsif options[:init]
		puts "initialize"	#��ʼ���������ݿ�
	else
		if target = options[:target]
			target = parse_target( target )
			if rule = options[:rule]
				puts "Load Rule: #{rule}"
			else
				if script = options[:script]
					puts "Use Script: #{script}"
				else
					puts "Load Default Rule"
				end
			end
		else
			puts "Target Cannot Be Empty!\n#{Time.now.strftime('%Y/%m/%d %H:%M:%S')}"
		end
	end
end

def parse_target( item )
	reg_domain = /[\w\d\-_\.]+[a-z]{2,4}/n
	reg_ipaddr = /[[0-9]{1,3}\.]{3}\.[0-9]{1,3}/n
	reg_iprang = /[[0-9]{1,3}\.]{3}\.[0-9]{1,3}\/[0-9]{1,2}/n
	if item =~ reg_domain
		puts "Get Domain: #{item}"
	elsif item =~ reg_ipaddr
		puts "Get IPaddr: #{item}"
	elsif item =~ reg_iprang
		puts "Get IPrang: #{item}"
	else
		puts "Else"
	end
	
	return item
end

def creat_task()
	
end

#���汾�͹������
def version(obj)
	version = Hash.new
	version["framework"] = "0.0.0"
	version["rules"]	= "20160104"
	return version[obj]
end
