# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "/log/cron_log.log"

every 5.minutes  do
  dump_path = "/User/eveadmin/rails/db_backups/dump#{Date.today.to_s}"
  command "sudo mysqldump -uroot -prootz feedbacker_development > #{dump_path}.sql"
  command "tar -zcvf #{dump_path}.tar.gz #{dump_path}.sql"
  command "rm #{dump_path}.sql"

  runner "Storage.store_dump '#{dump_path}.tar.gz'", :environment => :development
end


#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
