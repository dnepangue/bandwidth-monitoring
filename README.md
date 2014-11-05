bandwidth-monitoring
====================

Simple bandwidth monitoring script using vnstat


Installation
====================

Download the bwidthstat.sh into your preferred location. I usally put it on /root.

chmod +x bwidthstat.sh

Edit crontab to execute the script everyday or your preferred time.

59 23 * * * /root/bwidthstat.sh


NOTE: To update vnstat every 5 minutes, add this in your crontab.

*/5 * * * * /usr/bin/vnstat -u > /dev/null 2>&1
