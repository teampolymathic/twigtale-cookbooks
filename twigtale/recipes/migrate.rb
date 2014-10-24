node[:deploy].each do |app_name, deploy_config|
  # determine root folder of new app deployment
  app_root = "#{deploy_config[:deploy_to]}/current"

  execute 'migrate' do
    user 'ubuntu'
    command "sudo su - deploy -c 'cd #{app_root} && RAILS_ENV=production with_env bundle exec rake migrate:all'" 
  end
end
