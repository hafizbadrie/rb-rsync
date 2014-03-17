require './syncer.rb'
require 'test/unit'

class TestSyncer < Test::Unit::TestCase
	def test_find_config_should_return_empty_string_if_argument_is_empty
		argument = []

		config_file = Syncer.find_config argument
		assert_empty(config_file)
	end

	def test_find_config_should_return_config_file
		argument = ['config.yml', '-s', 'nothing']

		config_file = Syncer.find_config argument
		assert_equal('config.yml', config_file)
	end

	def test_open_yml_file_should_return_hash_object
		config_file = 'config.yml'

		config = Syncer.open_yml_file config_file
		assert(config.is_a?(Hash))
	end

	def test_open_yml_file_should_return_hash_object_with_keys
		config_file = 'config.yml'

		config = Syncer.open_yml_file config_file
		assert_not_nil(config['root'])
		assert_not_nil(config['target_root'])
		assert_not_nil(config['files'])
		assert_not_nil(config['target_user'])
		assert_not_nil(config['target_hosts'])
	end

	

end