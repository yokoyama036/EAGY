server '52.195.28.112', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/home/yokoyama/.ssh/id_rsa'