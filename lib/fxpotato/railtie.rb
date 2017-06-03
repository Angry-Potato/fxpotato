class FxPotato::Railtie < Rails::Railtie
  rake_tasks do
    load 'tasks/fetch_new_rates.rake'
    load 'tasks/update_crontab.rake'
    load 'tasks/clear_crontab.rake'
  end
end
