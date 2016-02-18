
$LOAD_PATH << File.dirname(__FILE__)

require 'config'
require 'alive'
require 'portscan'

#ɨ��ϵͳ��ʼ��
def init()
	puts "Init"
end

def args_parse(options)
	if output = options[:output]
		puts "Output To File: #{output}"
	end
	if import = options[:import]
		puts "Launch Task:#{import}"
		#ִ�е����ɨ������
		create_task( 3, "task_path", targets )
		
	elsif export = options[:export]
		#����ɨ������
		puts "Export Task:#{export}" 
	elsif list = options[:list]
		#��ʾ����
		puts "list: #{list}"
	elsif options[:update]
		#���¹����
		puts "updating..."
	elsif options[:init]
		#��ʼ���������ݿ�
		puts "initialize"
	else
		if target = options[:target]
			#����ʹ�ú�����Ŀ����д�����������ʽ������Ŀ��
			targets = parse_target( target )
			
			if rule = options[:rule]
				#���ָ�����ض��Ĺ������ｫʹ���ض��Ľű�����ɨ��
				puts "Load Rule: #{rule}"
				#�����ض���������
				create_task( 2, "rule_name", targets )
			else
				if script = options[:script]
					#���ָ���˵����ű���������ɨ�裬��ô�ʹ���������ɨ��
					puts "Use Script: #{script}"
					create_task( 1, "script_name", targets )
				else
					#��Ȼ�Ļ�������Ĭ�Ϲ��򣬴��������ɨ��
					puts "#{time} Load Default Rule"
					#puts Iconv.new('gbk', 'utf-8').iconv("����" )
					#Ĭ�ϵĹ���������ȫ���Ľű�
					create_task( 0, 0, targets )
				end
			end
		else
			#û��ָ��ɨ��Ŀ�꣬�����˳�
			puts "Target Cannot Be Empty!\n#{time}"
		end
	end
end

#Ϊ���ƽ�����ĳ���������ʱ��д���������
def parse_target( item )
	targets = Array.new
	targets.push( item )
end

#�������������Ŀ�괦����
#�������������Ŀ�괦�������
#0.����ǵ���ip��������ֱ�ӷ��س�����
#1.������������ͣ�����a.com��a.com,b.com��a.com b.com,�Զ��ָ��齨����
#2.����������ַ���ͣ��л��ɵ���ip��������飬��192.168.0.0/24�����ص���������Ϊ192.168.0.1-192.168.0.255
def parse_target_( item )
	reg_domain = /[\w\d\-_\.]+[a-z]{2,4}/n
	reg_ipaddr = /[[0-9]{1,3}\.]{3}\.[0-9]{1,3}/n
	reg_iprang = /[[0-9]{1,3}\.]{3}\.[0-9]{1,3}\/[0-9]{1,2}/n
	if item =~ reg_domain
		puts "DOMAIN: #{item}"
	elsif item =~ reg_ipaddr
		puts "IPADDR: #{item}"
	elsif item =~ reg_iprang
		puts "IPRANGE: #{item}"
	else
		puts "Else"
	end
	
	return item
end

#����ɨ������
def create_task(type, item, targets)
=begin
�ú�������Ϊ��
type:��������
	0:Ĭ������
	1:single scripts
	2:define rule
	3:launch task
item:����
	type	item		targets
	0		0			targets
	1		script_name	targets
	2		rule_name	targets
	3		task_path	null
targets:Ŀ�꣬��������
=end
	case type
		when 0
			puts "#{time} Default Task"
			
		when 1
			puts "script task"
		when 2
			puts "rule task"
		when 3
			puts "launch task"
		else
			puts "unknow task"
		end
	targets.each do | target |
		puts target
	end
end

def time(*item)
	case item
		when 0
			return Time.now.strftime('%Y-%m-%d %H:%M:%S')
		when 1
			return Time.now.strftime('%Y/%m/%d %H:%M:%S')
		when 2
			return Time.now.strftime('%Y%m%d %H:%M:%S')
		else
			return Time.now.strftime('%H:%M:%S')
		end
end


#���汾�͹������
def version(obj)
	version = Hash.new
	version["framework"] = "0.0.0"
	version["rules"]	= "20160104"
	return version[obj]
end
