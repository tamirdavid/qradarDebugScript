# QRadar server debuging
This script can be used to debug qradar linux servers both remote and local servers.
It checks QRadar critical services and return their status (UP = Green /DOWN = Red). If the service status is down there is short explanation
about what is the implication of it.
In addition, output include iptables output and input rules and data about free space and critical directories size.

# Step 1
Copy those 2 shell scripts to your QRadar console

# Stop 2
Execute runQRadarCheckRemote.sh with or without server ip as an argument

# Step 3
Investigation the output
