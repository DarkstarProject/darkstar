-----------------------------------
-- Area: Castle Oztroja
-- NPC:  Brass Door
-- Note: Opened by handles _47f to _47i
-- @pos -182 -15 -19 151
-----------------------------------
package.loaded["scripts/zones/Castle_Oztroja/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Castle_Oztroja/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if (npc:getAnimation() == 9) then
		player:messageSpecial(ITS_LOCKED);
		return 1;
	end	
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("upCSID: %u",csid);
--printf("upRESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;