env :PATH, ENV['PATH']

every 1.day, :at => '0:01 am' do
  rake 'fetch_new_rates'
end
