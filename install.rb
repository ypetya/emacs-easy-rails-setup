#!/usr/bin/env ruby
#
# Configure emacs for RoR development
#

# Define variables
userhome=ENV["HOME"]
emacsfile = "#{userhome}/.emacs"
emacsfilebak = "#{userhome}/.emacs.before_script.bak"
emacsdir = "#{userhome}/.emacs.d"
emacsdirbak = "#{userhome}/.emacs.d.before_script.bak"


# Install Ports
%w[emacs cedet-common cedet-contrib css-mode debian-el ecb ede emacs-goodies-el html-helper-mode ruby-elisp semantic speedbar yaml-mode].each do|port|
	puts "Installing #{port}..."
	`sudo apt-get -y install #{port}`
end


puts "Copying emacs config file..."

# Create first time backup only if backup doesn't exist
if File.exists?(emacsfile)
	if File.exists?(emacsfilebak)
		puts "Backup exists"
	else
		puts "Creating first time backup #{emacsfilebak}"
		`cp #{emacsfile} #{emacsfilebak}`
	end
end

# Create first time backup only if backup doesn't exist
if File.exists?(emacsdir)
	if File.exists?(emacsdirbak)
		puts "Backup exists"
	else
		puts "Creating first time backup #{emacsdirbak}"
		`cp -Rv #{emacsdir} #{emacsdirbak}`
	end
end

`cp .emacs #{userhome}`
`cp -Rv .emacs.d #{userhome}`





