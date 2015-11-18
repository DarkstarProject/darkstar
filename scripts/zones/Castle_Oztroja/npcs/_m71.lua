-----------------------------------
-- Area: Castle Oztroja
-- NPC:  _m71 (Torch Stand)
-- Involved in Mission: Magicite
-- @pos -99 24 -105 151
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
	
	if (player:hasKeyItem(YAGUDO_TORCH)) then
		player:startEvent(0x000b);
	else
		player:messageSpecial(PROBABLY_WORKS_WITH_SOMETHING_ELSE);
	end
	
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