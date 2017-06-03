namespace :fxpotato do
  desc "Clear crontab"
  task :clear_crontab do
    sh %{ whenever -c }
  end
end
