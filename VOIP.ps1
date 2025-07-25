﻿SIP CONFIGURATION: session initiation Protocol: non-Cisco
conf t
 voice service voip
  allow-connections h323 to sip    
  allow-connections sip to h323
  allow-connections sip to sip
  supplementary-service h450.12
 sip
   bind control source-interface fa0/0
   bind media source-interface fa0/0
   registrar server expires max 600 min 60
!
 voice register global
  mode cme
  source-address 10.42.100.8 port 5060
  max-dn 12
  max-pool 12
  authenticate register
  create profile sync
 voice register dn 1
   number 4261
   allow watch
   name 4261
 voice register dn 2
   number 4262
   allow watch
   name 4262
!
  voice register pool 1
    id mac ____.____.____
    number 1 dn 1
    dtmf-relay sip-notify
    username ____ password ____
    codec g711ulaw
!
  voice register pool 2
    id mac ____.____.____
    number 1 dn 2
    dtmf-relay sip-notify
    username ____ password ____
    codec g711ulaw
!