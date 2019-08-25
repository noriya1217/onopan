server '3.112.194.89', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/apple/.ssh/id_rsa'