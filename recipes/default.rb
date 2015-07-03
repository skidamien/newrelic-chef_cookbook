
apt_repository "newrelic" do
  uri "http://download.newrelic.com/debian/"
  distribution "newrelic"
  components ["non-free"]
  key "http://download.newrelic.com/548C16BF.gpg"
end

package 'newrelic-sysmond' do
  action :install
end

cookbook_file "/etc/newrelic/nrsysmond.cfg" do
  source "etc_newrelic_nrsysmond.cfg"
  owner "newrelic"
  group "newrelic"
  mode "0640"
  notifies :restart, "service[newrelic-sysmond]"
end

service "newrelic-sysmond" do
  action [:enable, :start]
end
