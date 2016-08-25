def perform id
  job_id = id
  raise TypeError
rescue
  puts "#{job_id} from rescue block"
  raise
end

perform 1
