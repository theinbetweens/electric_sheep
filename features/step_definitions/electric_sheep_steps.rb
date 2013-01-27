Then /^there should be a file "([^"]*)" with the following:$/ do |filename, file_content|
  puts '==========================='
	puts File.absolute_path('.')
  puts File.join(File.absolute_path('.'),filename)
  puts '==========================='
  File.open(filename).readline.should == file_content
end