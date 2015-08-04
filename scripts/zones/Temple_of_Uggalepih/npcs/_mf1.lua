-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  Granite Door
-- Notes: Door blocked by Temple Guardian
-- @pos -62 0 -99 159
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Temple_of_Uggalepih/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	local guardian = GetMobByID(17428494);

	if ( npc:getAnimation() == 9) then
		player:messageSpecial(PROTECTED_BY_UNKNOWN_FORCE);
	end
	
	if (guardian ~= nil and guardian:getHP() > 0 and guardian:getTarget() == nil) then
		guardian:updateClaim(player);
	end
	
	return 1;
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;