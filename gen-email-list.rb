# Generate list of emails from README.md
#
email_array = []
file = File.new("./README.md", "r")
while (line = file.gets)
  sections = line.split(" ")
  sections.each do |s|
    if !s.match(/\S{1,}\w{1}@\w{1}\S{2,}/).nil?
      unless s.include?(")") or s.include?("[")
        email_array << s
      end
    end
  end
end
p email_array
File.open('email-addresses', 'w') {|file| file.truncate(0) }
File.open("email-addresses", 'a') do |out|
  email_array.each_with_index do |email, i|
    if (i+1) != email_array.count
      out.write(email + ", ")
    else
      out.write(email)
    end
  end
end

file.close
