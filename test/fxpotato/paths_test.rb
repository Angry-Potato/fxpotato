require 'test_helper'
require 'pathname'

class PathsTest < Minitest::Test
  def test_data_directory_returns_something
    assert FxPotato::Paths.data_directory
  end

  def test_data_directory_returns_gem_root_data_dir
    assert_equal File.join(Dir.pwd, "data"), FxPotato::Paths.data_directory
  end

  def test_data_directory_returns_rails_root_data_dir_when_in_rails
    assert_equal FxPotato::Rails.root.join("data"), FxPotato::Paths.data_directory(true)
  end
end

module FxPotato
  class Rails
    def self.root
      Pathname.new('rails/root')
    end
  end
end
