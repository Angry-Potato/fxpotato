module FxPotato
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'tasks/fetch_new_rates.rake'
      load 'tasks/update_crontab.rake'
      load 'tasks/clear_crontab.rake'
    end

    config.after_initialize do
      DATA_DIRECTORY = File.join(Rails.root, "data")
    end
  end
end
