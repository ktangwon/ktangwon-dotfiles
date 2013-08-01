# ~/.bash_profile: executed by bash for login shells.

if [ -e ~/.bashrc ] ; then
  . ~/.bashrc
fi

# Put all local machine customizations in ~/.bash_local
if [ -e ~/.bash_local ] ; then
  . ~/.bash_local
fi


##
# Your previous /Users/ktangwon/.bash_profile file was backed up as /Users/ktangwon/.bash_profile.macports-saved_2012-11-01_at_10:33:58
##

# MacPorts Installer addition on 2012-11-01_at_10:33:58: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
