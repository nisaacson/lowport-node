# Bind a web server to low port without being root
include_recipe "nodejs"
package "libcap2-bin" do
  action :install
end

bash "setcap" do
  user 'root'
  code "sudo setcap cap_net_bind_service=+ep /usr/bin/nodejs"
  action :run
end

bash "upgrade_npm" do
  user 'root'
  code "sudo npm install -g npm"
  action :run
end
