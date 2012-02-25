Vagrant::Config.run do |config|
  config.vm.box = 'forskbox'
  config.vm.box_url = 'http://files.forskningsavd.se/boxes/forskbox.box'

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests/"
    puppet.manifest_file = "default.pp"
  end
end
