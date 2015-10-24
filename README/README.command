# great create directory command
mkdir -p /etc/skel/Maildir/{new,cur,tmp}

# stop sendmail
  /etc/init.d/sendmail stop
  service sendmail stop
  -> double use!

# file location
  $ locate xxx <- xxx is filename

# find program
  $ which gcc
  /usr/bin/gcc <- gcc location is /usr/bin/gcc

# update-alternatives is change current program file.
  update-alternatives --config java

  selection alternative
  ----------------------------------------
  1   /usr/bin/gij-4.2
  2   /usr/lib/jvm/java-gcj/jre/bin/java

# netstat dynamic show tcp connection
  $ netstat -an -tcp

  -> another shell

  $ apachectl stop
  $ apachectl start