manvsmagic
==========

A website for me to learn ruby and to display all the hilarious comics that my boyfriend thinks up.

http://www.manvsmagic.com 

If you don't have middleman installed:

	`gem install middleman`

When I first ran this cmd I got: 

`gem install middleman` 

`Fetching: bundler-1.5.3.gem (100%)`
`ERROR:  While executing gem ... (Gem::FilePermissionError)`
`You don't have write permissions for the /Library/Ruby/Gems/2.0.0 directory.`


Which means that I was on a computer (duh) that only had Apple's Ruby installed, so I installed RVM https://rvm.io/rvm/install :
(the slash in front is important, you can remove the --trace, i just like knowing all the information if something goes wrong, which it inevitably does)

	`\curl -sSL https://get.rvm.io | bash -s -- --trace`
	
After you either have to restart terminal or run source (doesn't matter which)

	`source ~/.rvm/scripts/rvm`
	
check if everything went okay:

	`type rvm | head -n 1`
	
should return "rvm is a function"

and you are finally ready to actually install middleman:

	`gem install middleman`
	
Oh man I still get the same permission error, so i  check what version of ruby I am using:
	 
	 `ruby -v`
	 
	`ruby 2.0.0p247 (2013-06-27 revision 41674) [universal.x86_64-darwin13]`

As of Feb. 19, 2014 (today for me) that is the default ruby on a mac.


So turns out it is because I didn't actually tell rvm to use any different ruby, I should have ran :
(safe run after rvm is installed, will just update rvm if it is already installed)
	
	`rvm get stable --ruby`
	
use the updated rvm (not necessary, because it was already installed, but just in case)	

	` ~/.rvm/scripts/rvm`
	
now this should say return a version other than the one that showed up when you ran ruby -v
	`rvm list default`

	`Default Ruby (for new shells)`

	   `ruby-2.1.0 [ x86_64 ]`
	   
	   
Maybe we are lucky and can install middleman now? please?
	`gem install middleman`
tentative success! I see:
	`Building native extensions.`  
This could take a while...	
Fine, I will go get a coffee . . . . . 
. . . . . . . . . 
Still? 
Ugh
. . . . . . . .
Yah! 46 seconds . . . man I swear it felt way longer.

then: 

	`cd /wherever/you/cloned/the/repo/manvsmagic`

And run the middle man server:

	`bundle exec middleman`
	
shit:
	
	```bundle exec middleman
	Could not find addressable-2.3.5 in any of the sources
	Run `bundle install` to install missing gems.```
	
Fine, do what the nice documentation says:
	
	`bundle install`
	
and moment of truth:
	
	`bundle exec middleman`
	
	``` The Middleman is loading
	== The Middleman is standing watch at http://0.0.0.0:4567
	== Inspect your site configuration at http://0.0.0.0:4567/__middleman/```

Fistpump!
	Now you can see the gloriesnes of the comic blog I built for my boyfriend.
To shut down the server 

	`ctrl + c`
	
I was getting a weird error about writing to logs and then I had to `ps aux | grep middle` and `kill -9 {ids}`  to stop the server, and it turns out that I had weird conflicting middleman-core and middleman-blog issues, so i just `gem uninstall ${gem}` for each of my installed middleman gems, and ran `gem install middleman` again, and everything was dandy candy again.

When everything is said and done, to generate the static pages that middleman is useful for, in your repo directory, run:
	`bundle exec middleman build`
	or, if something goes wrong, try:
	`middleman build --verbose`
Check it.
