#!/usr/bin/env ruby
#
# Configure emacs for RoR development
#


# Install Ports
%w[emacs cedet-common cedet-contrib css-mode debian-el ecb ede emacs-goodies-el html-helper-mode ruby-elisp semantic speedbar yaml-mode].each do|port|
	puts "Installing #{port}..."
	`sudo apt-get -y install #{port}`
end
