@CUCM
config t
   hostname CUCM-42
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
   Int Fa 0/0
     no shutdown
	 ip add 10.42.100.8 255.255.255.0 
	 end
   
!!!CUCM ANALOG PHONES CONFIG
configure terminal
dial-peer voice 1 pots
   destination-pattern 4200
   port 0/0/0
dial-peer voice 2 pots
   destination-pattern 4201
   port 0/0/1
dial-peer voice 3 pots
   destination-pattern 4202
   port 0/0/2
dial-peer voice 4 pots
   destination-pattern 4203
   port 0/0/3
end

!!IP telephony or Six Digit Salary.
config t   
no telephony-service
telephony-service
   no auto assign
   no auto-reg-ephone
   max-ephones 5
   max-dn 20
   ip source-address 10.42.100.8 port 2000
   create cnf-files
ephone-dn 1
  number 4211
ephone-dn 2
  number 4222
ephone-dn 3
  number 4233
ephone-dn 4
  number 4244
ephone-dn 5
  number 4255
ephone-dn 6
  number 4266
ephone-dn 7
  number 4277
ephone-dn 8
  number 4288
 ephone-dn 9
  number 4299
ephone-dn 10
  number 4298
Ephone 1
  Mac-address ccd8.c1fb.02b7
  type 8945
  button 1:8 2:7 3:6 4:5
  restart
Ephone 2
  Mac-address 204c.9e6c.8743
  type 8945
  button 1:4 2:3 3:2 4:1
  restart  
end

@@@Enabling Video Calls
configure terminal
ephone 1
   video
   voice service voip
   h323
   call start slow
ephone 2
   video
   voice service voip
   h323
   call start slow
end

!!@@allow incoming calls
configure terminal
voice service voip
ip address trusted list
ipv4 0.0.0.0 0.0.0.0
exit

!OUTGOING CALL FROM CUCM TO OTHER CUCM.
configure terminal
 dial-peer voice 11 Voip
 destination-pattern 11..
 session target ipv4:10.11.100.8
 codec g711ULAW
  dial-peer voice 12 Voip
  destination-pattern 12..
  session target ipv4:10.12.100.8
  codec g711ULAW
dial-peer voice 21 Voip
 destination-pattern 21..
 session target ipv4:10.21.100.8
 codec g711ULAW
dial-peer voice 22 Voip
 destination-pattern 22..
 session target ipv4:10.22.100.8
 codec g711ULAW
dial-peer voice 31 Voip
 destination-pattern 31..
 session target ipv4:10.31.100.8
 codec g711ULAW
dial-peer voice 32 Voip
 destination-pattern 32..
 session target ipv4:10.32.100.8
 codec g711ULAW
dial-peer voice 41 Voip
 destination-pattern 41..
 session target ipv4:10.41.100.8
 codec g711ULAW
! dial-peer voice 42 Voip
 ! destination-pattern 42..
 ! session target ipv4:10.42.100.8
 ! codec g711ULAW
dial-peer voice 51 Voip
 destination-pattern 51..
 session target ipv4:10.51.100.8
 codec g711ULAW
dial-peer voice 52 Voip
 destination-pattern 52..
 session target ipv4:10.52.100.8
 codec g711ULAW
dial-peer voice 61 Voip
 destination-pattern 61..
 session target ipv4:10.61.100.8
 codec g711ULAW
dial-peer voice 62 Voip
 destination-pattern 62..
 session target ipv4:10.62.100.8
 codec g711ULAW
dial-peer voice 71 Voip
 destination-pattern 71..
 session target ipv4:10.71.100.8
 codec g711ULAW
dial-peer voice 72 Voip
 destination-pattern 72..
 session target ipv4:10.72.100.8
 codec g711ULAW
dial-peer voice 81 Voip
 destination-pattern 81..
 session target ipv4:10.81.100.8
 codec g711ULAW
dial-peer voice 82 Voip
 destination-pattern 82..
 session target ipv4:10.82.100.8
 codec g711ULAW