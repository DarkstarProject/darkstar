-----------------------------------
-- Area: Xarcabard
-- NPC:  qm2 (???)
-- Involved in Quests: Atop the Highest Mountains (for Boreal Tiger)
-- @pos 341 -29 370 112
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
	
	if((os.time() - player:getVar("BorealTigerKilled")) < 200) then
		player:setVar("BorealTigerKilled",0);
		player:addKeyItem(ROUND_FRIGICITE);
		player:messageSpecial(KEYITEM_OBTAINED, ROUND_FRIGICITE);
	else
		player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
		player:setVar("BorealTigerKilled",0);
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