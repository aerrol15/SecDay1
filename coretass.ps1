config t
   hostname COREtaas-42
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
   Int Vlan 1
     no shutdown
	 ip add 10.4242.1.2 255.255.255.0
	 description MGMTDATA
   Int Vlan 10
     no shutdown
	 ip add 10.4242.10.2 255.255.255.0
	 description WIRELESS
   Int Vlan 50
     no shutdown
	 ip add 10.4242.50.2 255.255.255.0
	 description IPCCTV
   Int Vlan 100
     no shutdown
	 ip add 10.4242.100.2 255.255.255.0
	 description VOICEVLAN
end