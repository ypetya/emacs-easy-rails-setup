#!/usr/bin/env ruby
#
# Configure emacs for RoR development
#

# Define variables
userhome=ENV["HOME"]
emacsbak = "#{userhome}/.emacs.before_script"

=begin

# Install Ports
%w[emacs cedet-common cedet-contrib css-mode debian-el ecb ede emacs-goodies-el html-helper-mode ruby-elisp semantic speedbar yaml-mode].each do|port|
	puts "Installing #{port}..."
	`sudo apt-get -y install #{port}`
end

=end

puts "Copying emacs config file..."

# Create first time backup only if backup doesn't exist
if File.exists?(emacsbak)
	puts "Backup exists"
else
	puts "Creating first time backup #{emacsbak}"
	`cp #{userhome}/.emacs #{emacsbak}`
end

`cp .emacs #{userhome}`
`cp -Rv .emacs.d #{userhome}`





