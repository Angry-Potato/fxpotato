namespace :fxpotato do
  desc "Download new exchange rate data"
  task :fetch_new_rates do
    FxPotato.fetch_new_rates
  end
end
