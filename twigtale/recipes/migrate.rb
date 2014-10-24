node[:deploy].each do |app_name, deploy_config|
  # determine root folder of new app deployment
  app_root = "#{deploy_config[:deploy_to]}/current"

  execute 'migrate' do
    cwd app_root
    command "RAILS_ENV=production with_env bundle exec rake migrate:all" 
  end
end
