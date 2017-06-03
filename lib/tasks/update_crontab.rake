namespace :fxpotato do
  desc "Update crontab with fetch_new_rates job"
  task :update_crontab do
    if defined?(Rails)
      source = File.join(Gem.loaded_specs["fxpotato"].full_gem_path, "config", "schedule.rb")
      target = File.join(Rails.root, "config", "schedule.rb")
      FileUtils.cp_r source, target
    end
    sh %{ whenever --update-crontab }
  end
end
