gamma:

all skirmishes call this common event when loading, this is a customized version that'll let you define your own map IDs

Attachment file type: unknown
zMasterSkirmishLoader.event
3.79 KB

and then define the corresponding locations in a bytelist at $206948 (max length 9)
and then in your "world map locations" CSV, set "Flags" for those locations to 0x200 to enable skirmishes
in the chapter events, make sure you create definitions for PlayerSkirmishUnits and EnemySkirmishUnits (you can have up to 3 each) and put the pointers to them in those "Dunno" slots between the player units pointers and the beginning/end event pointers
finally at $2069d8 and $2069e3 there are bytelists for "which chapter needs to be cleared before skirmishes can appear at the locations in $206948?"
(first pointer is eirika mode, second pointer is ephraim mode)
and lastly, at $2069EE and $206A51 are the probability tables for where the skirmishes will spawn, you can define a % rate that they will spawn at each location and each entry corresponds to the "which chapter needs to be cleared" table. (don't spawn anything at a node/chapter you havent cleared yet, it spawns buggy map units)