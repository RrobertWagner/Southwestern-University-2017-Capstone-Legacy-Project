Capstone2015
============

Hello!

### Setting up with Vagrant

To setup a virtual development environment, make sure you
have [Vagrant] and [VirtualBox] installed.

In a console or command prompt, `cd` to this directory and
run: `vagrant up`

This will download and setup a virtual machine, which may
take some time. When it's done, the rails development server
should be started at localhost:3000 which can be opened in
a web browser.

#Christian Commited stuff

To stop a the vagrant machine, use the command `vagrant halt`. The machine can then be started again with `vagrant up`.

In order to run rails or rake commands through the console, you will need to ssh into the virtual box. This can by done by running `vagrant ssh` in the command line after starting the virtual machine. You can exit your ssh session by running `exit` or pressing Ctrl-D.   

Other relevant vagrant commands: 
`reload`: restarts vagrant machine, loads new Vagrantfile configuration
`resume`: resume a suspended vagrant machine
`status`: outputs status of the vagrant machine
`suspend`: suspends the machine rather than closing it entirely

[Vagrant]:https://www.vagrantup.com/
[VirtualBox]:https://www.virtualbox.org/


kstuck!


see you later alligator -anna

Rebecca:
git checkout Engine (moves to Engine branch from master)
git pull origin master  (updates the files in local copy of engine branch to whatever is in the master)
git push origin Engine (pushes changes that we just pulled to our local copy to the whole branch everywhere all the time)

