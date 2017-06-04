require 'test_helper'
require 'pathname'

class PathsTest < Minitest::Test
  def test_data_directory_returns_something
    assert FxPotato::Paths.data_directory
  end

  def test_data_directory_returns_gem_root_data_dir
    assert_equal File.join(Dir.pwd, "data"), FxPotato::Paths.data_directory(false, {})
  end

  def test_data_directory_returns_rails_root_data_dir_when_in_rails
    assert_equal FxPotato::Rails.root.join("data"), FxPotato::Paths.data_directory(true, {})
  end

  def test_data_directory_returns_env_var_when_set
    env = {'FXPOTATO_DATA_DIR' => 'nice/place'}
    assert_equal env["FXPOTATO_DATA_DIR"], FxPotato::Paths.data_directory(true, env)
  end

  def test_data_source_url_returns_default_when_env_var_not_set
    assert_equal FxPotato::DEFAULT_SOURCE_URL, FxPotato::Paths.data_source_url({})
  end

  def test_data_source_url_returns_env_var_when_set
    env = {'FXPOTATO_DATA_SOURCE_URL' => 'nice/place'}
    assert_equal env["FXPOTATO_DATA_SOURCE_URL"], FxPotato::Paths.data_source_url(env)
  end
end

module FxPotato
  class Rails
    def self.root
      Pathname.new('rails/root')
    end
  end
end
