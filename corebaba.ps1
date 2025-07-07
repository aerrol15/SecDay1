@COREBABA
config t
   hostname COREbaba-42
   enable secret pass
   service password-encryption
   no logging console
   no ip domain-lookup
   line console 0
     password pass
     login
     exec-timeout 0 0
    line vty 0 14
      password pass
      login
      exec-timeout 0 0
   Int Gi 0/1
     no shutdown
	  no switchport
	  ip add 10.42.42.4 255.255.255.0
   Int Vlan 1
     no shutdown
	 ip add 10.42.1.4 255.255.255.0
	 description MGMTDATA
   Int Vlan 10
     no shutdown
	 ip add 10.42.10.4 255.255.255.0
	 description WIRELESS
   Int Vlan 50
     no shutdown
	 ip add 10.42.50.4 255.255.255.0
	 description IPCCTV
   Int Vlan 100
     no shutdown
	 ip add 10.42.100.4 255.255.255.0
	 description VOICEVLAN
end

WARNING: IF YOU SEE AMBER/ORANGE= NEEDS FIXING!!!

Trunk Ports: switch to switch:
TAAS/BABA:
config t
Int Range fa0/10-12
 shutdown
 no shutdown
 switchport trunk Encap Dot1Q
 switchport mode trunk
 do sh int trunk
end

CCNPSkillsNow: Etherchannel with LinkAggregationControlProtocol:
WARNING: THREE CABLES IS BETTER THAN ONE!
@taas/BABA:
config t
Int Range fa0/10-12
 channel-group 1 mode active
 channel-protocol Lacp
 do sh etherchannel summary
 do sh int po1 | inc BW


!DHCP: DYNAMIC HOST CONFIGURATION PROTOCOL
!!!DAPAT 21 UNDER SCORE ANG NA EDIT MO  ( LINE 72 to 99 PASTE TO COREBABA SWITCH )
!@@@LEAF SWITCH
config t
ip dhcp Excluded-add 10.42.1.1 10.42.1.100
ip dhcp Excluded-add 10.42.10.1 10.42.10.100
ip dhcp Excluded-add 10.42.50.1 10.42.50.100
ip dhcp Excluded-add 10.42.100.1 10.42.100.100
ip dhcp pool MGMTDATA
   network 10.42.1.0 255.255.255.0
   default-router 10.42.1.4
   domain-name MGMTDATA.COM
   dns-server 10.42.1.10
ip dhcp pool WIFIDATA
   network 10.42.10.0 255.255.255.0
   default-router 10.42.10.4
   domain-name WIFIDATA.COM
   dns-server 10.42.1.10
ip dhcp pool IPCCTV
   network 10.42.50.0 255.255.255.0
   default-router 10.42.50.4
   domain-name IPCCTV.COM
   dns-server 10.42.1.10
ip dhcp pool VOICEVLAN
   network 10.42.100.0 255.255.255.0
   default-router 10.42.100.4
   domain-name VOICEVLAN.COM
   dns-server 10.42.1.10
   option 150 ip 10.42.100.8   
   END

!!CREATING AND PLACING PORTS INSIDEAVLAN:
( LINE 103 to 141 PASTE TO COREBABA SWITCH )
config t
vlan 10
   name WIFIVLAN
vlan 50
   name IPCCTVLAN
vlan 69
   name UPPERMGMT
vlan 70
    name ACCOUNTING
vlan 71
    name HR
vlan 100
   name VOICEVLAN
Int Fa 0/2
  switchport mode access
  switchport access vlan 10  
Int Fa 0/4
  switchport mode access
  switchport access vlan 10
Int Fa 0/6
  switchport mode access
  switchport access vlan 50  
Int Fa 0/8
  switchport mode access
  switchport access vlan 50    
Int Fa 0/3
  switchport mode access
  switchport access vlan 100     
Int Fa 0/5
  switchport mode access  
  switchport voice vlan 100
  mls qos trust device cisco-phone 
  switchport access vlan 1
Int Fa 0/7
  switchport mode access
  switchport voice vlan 100 
  mls qos trust device cisco-phone 
 switchport access vlan 1
 end

!IP CAMERAS NEED MAC ADDRESS RESERVATION FOR FIXED IP SECURITY.  (LINE 144 to 151 PASTE TO COREBABA)
config t
ip routing
ip dhcp pool CAMERA6
host 10.42.50.6 255.255.255.0
client-identifier 42424242.42424242.42424242
ip dhcp pool CAMERA8
host 10.42.50.8 255.255.255.0
client-identifier42424242.42424242.42424242
end