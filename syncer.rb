require 'yaml'
require 'rsync'

class Syncer
	def self.find_config(argument)
		config_file = argument[0] || ""
		config_file
	end

	def self.open_yml_file(config_file)
		config = YAML.load_file(config_file)
		config
	end

	def self.sync_file(local_file, target_user, target_host, target_location)
		prefix = (target_user.empty? or target_host.empty?) ? '' : target_user + "@" + target_host + ":"
		result = Rsync.run(local_file, prefix + target_location)
		result
	end
end