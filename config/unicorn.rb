root = "/home/deployer/deploy/bennett-ci/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.bennett-ci.com.socket"
worker_processes 2
timeout 30
