-----------------------------------
-- Area: Xarcabard
-- NPC:  ??? (for Boreal Hound)
-- Involved in Quests: Atop the Highest Mountains
-- @zone 112
-- @pos -21 -25 -490
-----------------------------------
package.loaded["scripts/zones/Xarcabard/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Xarcabard/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if((os.time() - player:getVar("BorealHoundKilled")) < 200) then
		player:setVar("BorealHoundKilled",0);
		player:addKeyItem(TRIANGULAR_FRIGICITE);
		player:messageSpecial(KEYITEM_OBTAINED, TRIANGULAR_FRIGICITE);
	else
		player:messageSpecial(NOTHING_ORDINARY_HERE);
		player:setVar("BorealHoundKilled",0);
	end
	
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