server '54.238.197.63', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/home/yokoyama/.ssh/id_rsa'