bandwidth-monitoring
====================

Simple bandwidth monitoring script using vnstat


Installation
====================

Install vnstat via yum if your using CentOS or apt in Ubuntu/Debian. You should add EPEL repository in CentOS server for you to install vnstat since it's not included in the default package. You can follow this http://www.tecmint.com/how-to-enable-epel-repository-for-rhel-centos-6-5/ for instructions.


Download the bwidthstat.sh into your preferred location. I usally put it on /root.

chmod +x bwidthstat.sh

Edit crontab to execute the script everyday or your preferred time.

59 23 * * * /root/bwidthstat.sh


NOTE: To update vnstat every 5 minutes, add this in your crontab.

*/5 * * * * /usr/bin/vnstat -u > /dev/null 2>&1



To Do
====================

Add support for vnsati, and improve version of vnstat with graphs.
