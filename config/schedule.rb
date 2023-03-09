set :output, './log/cron.log'
require File.expand_path(File.dirname(__FILE__) + '/environment')
set :path_env, ENV['PATH']
set :environment, :production
job_type :runner, "cd :path && PATH=':path_env' bin/rails runner -e :environment ':task' :output"

every 10.minutes do
  runner 'Post.deadline_check'
end
