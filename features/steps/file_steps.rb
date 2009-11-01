Given /^I am in "([^\"]*)"$/ do |directory|
  #File.chdir(directory)
  @basedir = directory
end

Given /^the file "([^\"]*)" exists$/ do |filename|
  File.exists?(File.join(@basedir, filename)).should be_true
end

When /^I copy the file "([^\"]*)" to "([^\"]*)"$/ do |src, dest|
  FileUtils.cp(File.join(@basedir, src), File.join(@basedir, dest))
end

Then /^the file "([^\"]*)" should exist$/ do |filename|
  File.exists?(File.join(@basedir, filename)).should be_true
end

Given /^the following files exist:$/ do |table|
  (@files_i_care_about || table.hashes).each do |file|
    File.exists?(File.join(@basedir, file["filename"])).should be_true
  end
end

When /^I copy the following files to "([^\"]*)":$/ do |destination, table|
  table.hashes.each do |file|
    filename = File.join(@basedir, file["filename"])
    FileUtils.cp(filename, destination)
  end
end

Then /^the following files should exist in "([^\"]*)":$/ do |destination, table|
  table.hashes.each do |file|
    File.exists?(File.join(destination, file["filename"])).should be_true
  end
end

When /^I create the directory "([^\"]*)"$/ do |directory|
  FileUtils.mkdir_p(directory).should_not be_nil
end

Given /^the following table of (.+):$/ do |name, table|
  @tables = {}
  @tables[name] = table.hashes
end

When /^I copy the (.+) in the table to "([^\"]*)"$/ do |name, destination|
  @tables[name].each do |file|
    filename = File.join(@basedir, file["filename"])
    FileUtils.cp(filename, destination)
  end
end

Then /^the (.+) in the table should exist in "([^\"]*)"$/ do |name, destination|
  @tables[name].each do |file|
    File.exists?(File.join(destination, file["filename"])).should be_true
  end
end

When /^I copy files beginning with the letters (\S+) to "([^\"]*)"$/ do |pattern, destination|
  patterns = pattern.split(',')
  @filelist = []
  @destination = destination
  patterns.each do |pattern|
    glob = Dir.glob(File.join(@basedir, "#{pattern}*"))

    actual_files = glob.find_all do |filename| 
      File.file?(filename)
    end

    @filelist << actual_files.map do |filename| 
      File.basename(filename) 
    end
  end
  @filelist.flatten!
  @filelist.each do |filename|
    FileUtils.cp(File.join(@basedir, filename), @destination)
  end
end

Then /^they should exist there$/ do
  raise unless @filelist && @destination
  @filelist.each do |filename|
    File.exists?(File.join(@destination, filename)).should be_true
  end
end

