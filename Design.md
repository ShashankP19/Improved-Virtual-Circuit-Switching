# A Improved Virtual Circuit Switching Technology Based on Concurrent Processing Mode

Virtual circuit switch is composed of five parts:
* Input Buffer Queue
* Table Lookup Module
* Dispatcher
* Fabric
* Output Buffer Queue
* * *

The delays of above five steps include five parts:
* TLD - Table Lookup Delay
* WSD - Wait for Service Delay
* DD - Dispatch Delay
* FTD - Fabric Transfer Delay
* OD - Output Delay

* * *
## Switch Handle Delay of traditional virtual circuit network


Switch Handle Delay of traditional virtual circuit network is calculated as follows:

__SHD = TLD + WSD + DD + FTD + OD__

* * *
## Switch Handle Delay of Half Step Forward Switching Technology (HSFST)


Switch Handle Delay of Half Step Forward Switching Technology is calculated as follows:

__SHD = WSD + DD + max(FTD, TLD) + OD__

* * *
## Delay Jitter of traditional virtual circuit network

Delay Jitter of traditional virtual circuit network is calculated as follows:

__&#916;(SHD) = &#916;(TLD + WSD + DD + FTD + OD)__

* * *
## Delay Jitter of Half Step Forward Switching Technology (HSFST)

Delay Jitter of Half Step Forward Switching Technology (HSFST) is calculated as follows:

__&#916;(HFS-SHD) = &#916;(|TLD-FTD| + WSD + DD + OD)__


* * *