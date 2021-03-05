#
# Cookbook:: gcs-app
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

template '/etc/nginx/nginx.conf' do
	source "nginx.conf.erb"
	variables({
		:webServerPublicIp => node['gcs-app']['webServerPublicIp']
	})
end

template '/etc/gcs-app/application.conf' do
	source "application.conf.erb"
	variables({
		:webServerPublicIp => node['gcs-app']['webServerPublicIp'],
		:dbServerPrivateIp => node['gcs-app']['dbServerPrivateIp'],
		:dbName => node['gcs-app']['dbName'],
		:dbPort => node['gcs-app']['dbPort'],
		:dbUser => node['gcs-app']['dbUser'],
		:dbPassword => node['gcs-app']['dbPassword']
	})
end
