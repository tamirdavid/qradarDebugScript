echo
Red='\033[0;31m'
NC='\033[0m'
Green='\033[0;32m'
Blue='\e[36m'
Blink='\e[5m'
UnderLine='\e[4m'

echo -e "${UnderLine}${Blue}Services Check:${NC}"
systemctl -q is-active ariel_proxy_server &&\echo -e "${Green}ariel_proxy_server is running${NC}"||
 \echo -e "${Red}ariel_proxy_server is not Running${NC} - all requests to managed host for data from searches would stop until this server restarts"
echo
systemctl -q is-active ariel_query_server &&\echo -e "${Green}eariel_query_server is running${NC}"||
 \echo -e "${Red}ariel_query_server is not Running${NC} - all searches of the ariel data base would stop on the managed hosts"
echo
systemctl -q is-active asset_profiler &&\echo -e "${Green}asset_profiler is running${NC}"||
 \echo -e "${Red}asset_profiler is not Running${NC} - assets would not be added or updated until this service came back online"
echo
echo "this service relevant only for event collector"
systemctl -q is-active ecs-ec &&\echo -e "${Green}ecs-ec is running${NC}"||
 \echo -e "${Red}ecs-ec is not Running${NC} - impacts parsing and normalizing events and flows would stop"
systemctl -q is-active ecs-ec-ingress &&\echo -e "${Green}ecs-ec-ingress is running${NC}"||
 \echo -e "${Red}ecs-ec-ingress is not running${NC} -  when stopped would not allow events to be collected in a buffer and spooled to the other ecs service"
echo
echo "this service relevant only for Event Prcessor"
systemctl -q is-active ecs-ep &&\echo -e "${Green}ecs-ep is running${NC}"||
 \echo -e "${Red}ecs-ep is not Running${NC}"
echo
systemctl -q is-active historical_correlation_server &&\
 echo -e "${Green}historical_correlation_server  is running${NC}"||
 \echo -e "${Red}historical_correlation_server  is not Running${NC} - impacts historical searches on offense data"
echo
systemctl -q is-active hostcontext &&\
 echo -e "${Green}hostcontext is running${NC}"||
 \echo -e "${Red}hostcontext is not Running${NC} - hostcontext is the mannger for all the other services except ecs-ingress. all services control by hostcontext would be inactive untill they restarted"
echo

systemctl -q is-active hostservices &&\
 echo -e "${Green}hostservices is running${NC}"||
 \echo -e "${Red}hostservices is not Running${NC} - the data base stops working as well as IMQ. this also impacts hostcontext and tomcat"
echo

systemctl -q is-active reporting_executor &&\echo -e "${Green}reporing_executor is running${NC}"||
 \echo -e "${Red}reporting_executor is not Running${NC} - all running reports would be cancaled and would need to be restared. new scheduled reports would not run untill this service starts"
echo
systemctl -q is-active tomcat &&\echo -e "${Green}tomcat is running${NC}"||
 \echo -e "${Red}tommcat is not Running${NC} - UI would not be available"

echo "Services Check done......"
echo
echo

echo -e "${UnderLine}${Blue}report of free disk space:${NC}"
df -h
echo
echo "Free disk space check is done...."
echo

echo -e "${UnderLine}${Blue}Iptables"
 echo -e "${Green}iptables is running${NC}"||
 \echo -e "${Red}iptables is not Running${NC} - iptables Firewall is not running"

echo "${underline}${blue}Iptables rules${NC}"
iptables -L -n

echo
echo  -e "${UnderLine}${Blue}free -m output${NC}"

free -m 
