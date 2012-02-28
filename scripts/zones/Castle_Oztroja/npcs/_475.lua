-----------------------------------
-- Area: Castle Oztroja
-- NPC:  Brass Door
-- Involved in Mission: Magicite
-- @zone 151
-- @pos -99 24 -105
-----------------------------------
package.loaded["scripts/zones/Castle_Oztroja/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Castle_Oztroja/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(ITS_LOCKED);
	return 1;
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);	
end;