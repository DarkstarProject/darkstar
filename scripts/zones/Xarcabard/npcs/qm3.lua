-----------------------------------
-- Area: Xarcabard
-- NPC:  qm3 (???)
-- Involved in Quests: Atop the Highest Mountains (for Boreal Coeurl)
-- @pos 580 -9 290 112
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
	
	if((os.time() - player:getVar("BorealCoeurlKilled")) < 200) then
		player:setVar("BorealCoeurlKilled",0);
		player:addKeyItem(SQUARE_FRIGICITE);
		player:messageSpecial(KEYITEM_OBTAINED, SQUARE_FRIGICITE);
	else
		player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
		player:setVar("BorealCoeurlKilled",0);
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