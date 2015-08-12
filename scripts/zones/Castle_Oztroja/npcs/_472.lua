-----------------------------------
-- Area:  Castle Oztroja
-- NPC:   Brass Door
-- Notes: Opened by handle near password 1
-- @pos -59 0.5 -28 151
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