require './syncer.rb'

config_file = Syncer.find_config(ARGV)
config = Syncer.open_yml_file(config_file)

config["files"].each do |file|
	config["target_hosts"].each do |host|
		local_file = config['root'] + file
		target_file = config['target_root'] + file

		puts "Syncing " + local_file + " to " + config["target_user"] + "@" + host + ":" + target_file

		result = Syncer.sync_file(local_file, config["target_user"], host, target_file)

		puts (result.success?) ? 'Synced!' : 'Not Synced!'
		puts ""
	end
end