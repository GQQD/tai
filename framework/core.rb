
$LOAD_PATH << File.dirname(__FILE__)

require 'log'
require 'config'
require 'alive'
require 'tasks'
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

#���ص�ǰʱ��
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
