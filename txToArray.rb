open_file = File.open("MyClippings.txt")
file_splited = open_file.read.split('==========')
out_file = File.new("test.txt", "w")
file_splited.each {|line| out_file.puts(line)}
out_file.close
puts "File iS Saved"
