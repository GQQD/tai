$LOAD_PATH << File.dirname(__FILE__)

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
def create_task(type, item, targets)
	case type
		when 0
			#Ĭ��ɨ������
			#����ȫ��ɨ�����
			puts "#{time} Default Task #{item} For #{targets}"
			create_task(2, 0, targets )
		when 1
			#���ű�ģʽ
			#����ģʽ��ͨ���жϹ����а�����Ŀ������������ɨ���߳�
			puts "#{time} Use Script #{item} #{targets}"
		when 2
			#����ģʽ
			#����ģʽ��ͨ���жϹ����а����Ľű�����������ɨ���߳�
			puts "#{time} Use Rule #{item} For #{targets}"
			targets.each do | target |
				rule = parse_rule( item.to_i )
				puts "#{time} Rule Name #{rule['name']}"
				puts "#{time} Rule File In #{rule['file']}"
				rule['scripts'].each do |script|
					puts "#{time} #{script} -> #{target}"
					require script
					p = Poc.new
					p.verify( target )
				end
			end
		when 3
			#����ģʽ(���Թ��ൽ�����ģʽ��)
			puts "#{time} Launch Task #{item} #{targets}"
		else
			puts "#{time} Unknow Command #{item} #{targets}"
		end
end

def parse_rule(rule_id)
	rule = Hash.new
	rule['id']	 = rule_id.to_i
	rule['file'] = "#{$RULE_PATH}/#{rule['id']}"
	rule['name'] = "RULE:#{rule_id}"
	scripts = Array.new
	#����Ϊ/rules/�µ������ļ������е�ÿһ�д洢һ���ű�����
	#�����ļ���������ʽΪ id-name.rule,�� 0:default.rule
	IO.foreach( rule['file'] ) do | s |
		scripts.push( s.chomp )
	end
	rule['scripts'] = scripts
	return rule
end

def getRuleNameById( id )

end



