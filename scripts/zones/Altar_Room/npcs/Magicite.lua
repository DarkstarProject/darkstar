-----------------------------------
-- Area: Altar Room
-- NPC:  Magicite
-- Involved in Mission: Magicite
-- @zone 152
-- @pos -344 25 43
-----------------------------------
package.loaded["scripts/zones/Altar_Room/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Altar_Room/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if (player:getCurrentMission(player:getNation()) == 13 and player:hasKeyItem(MAGICITE_ORASTONE) == false) then
		if (player:getVar("MissionStatus") < 4) then
			player:startEvent(0x002c,1); -- play Lion part of the CS (this is first magicite)
		else
			player:startEvent(0x002c); -- don't play Lion part of the CS 
		end
	else
		player:messageSpecial(THE_MAGICITE_GLOWS_OMINOUSLY);
	end
	
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
	
	if (csid == 0x002c) then
		player:setVar("MissionStatus",4);
		player:addKeyItem(MAGICITE_ORASTONE);
		player:messageSpecial(KEYITEM_OBTAINED,MAGICITE_ORASTONE);
	end
	
end;