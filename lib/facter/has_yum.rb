Facter.add('has_yum') do
  setcode { File.exist?('/usr/bin/yum') ? 'true' : 'false' }
end
