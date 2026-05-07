Vagrant.configure("2") do |config|

	# config.vm.box = "perk/ubuntu-2204-arm64"
	config.vm.box = "gyptazy/ubuntu22.04-arm64"

	# Forward ports for Terramino (8081 for frontend, 8080 for backend)
	config.vm.network "forwarded_port", guest: 8080, host: 8080
	config.vm.network "forwarded_port", guest: 8081, host: 8081

	# Sync the terramino-go directory
	config.vm.synced_folder "./terramino-go", "/home/vagrant/terramino-go", create: true

	# Install Docker and dependencies
	config.vm.provision "shell", name: "install-dependencies", path: "scripts/install-dependencies.sh"

	# Start Terramino (can be rerun with vagrant provision --provision-with start-terramino)
	config.vm.provision "shell", name: "start-terramino", inline: <<-SHELL
		cd /home/vagrant/terramino-go
		docker compose up -d
	SHELL

	# Restart Terramino (can be rerun with vagrant provision --provision-with restart-terramino)
	# For quick changes that doesn't require rebuilding (e.g. frontend changes)
	config.vm.provision "shell", name: "restart-terramino", run: "never", inline: <<-SHELL
		docker compose restart
	SHELL

	# Reload Terramino (can be rerun with vagrant provision --provision-with reload-terramino)
	# For changes that require rebuilding (e.g. backend changes)
	config.vm.provision "shell", name: "reload-terramino", run: "never", inline: <<-SHELL
		/usr/local/bin/reload-terramino
	SHELL

end

