# csevpn

1. Download the setup files in Ubuntu Linux.
Setup files: cse-ipsecvpn.zip

2. In terminal, unzip the setup files in your home directory and execute vpn_setup.sh with sudo.
'$ cd'
'$ unzip cse-ipsecvpn.zip'
'$ cd cse-ipsecvpn/'
'$ sudo ./vpn_setup.sh'

3. After the cse-ipsecvpn connection is added, you need to enter your CSE username in
VPN Settings -> VPN / Identity -> User Name.
You may leave Password field blank. The system will ask for your Linux account password every time you connect to the VPN.

4. If you don’t want to tunnel all the Internet traffic through CSE VPN, set / select following checkbox.
*Ubuntu 18.04*
VPN Settings -> IPv4 -> Use this connection only for resources on its network
*Ubuntu 16.04*
VPN Settings -> IPv4 Settings -> Routes -> Use this connection only for resources on its network
Both verions, using nmcli command
'$ sudo nmcli conn modify cse-ipsecvpn ipv4.never-default true'
'$ sudo nmcli conn reload cse-ipsecvpn'
With this option, you can

 * Access CSE network (IP subnet 137,189.88.0/255.255.252.0) through CSE VPN
 * Access Internet through your wired / wireless connection
