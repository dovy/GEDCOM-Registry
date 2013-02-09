#!/usr/bin/ruby

input = STDIN.read

# find quoted cells and replace commas inside quotes with placeholder
input.gsub!(/"([^,].*?)"/m) { |quoted|
	quoted.gsub(/[\n\r]*/,'').gsub(/,/,'zXzX')
}
# replace remaining commas with table divider (pipe)
input.gsub!(/,/,"| ")
# remove quotes from quoted cells
input.gsub!(/(\| |^)"(.*?)"/,"\\1\\2")
# replace placeholders with commas
input.gsub!(/zXzX/,",")

input.each { |l|
	puts "| #{l.strip} |"
}
