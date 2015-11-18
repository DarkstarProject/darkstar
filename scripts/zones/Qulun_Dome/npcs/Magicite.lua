-----------------------------------
-- Area: Qulun Dome
-- NPC:  Magicite
-- Involved in Mission: Magicite
-- @pos 11 25 -81 148
-----------------------------------
package.loaded["scripts/zones/Qulun_Dome/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Qulun_Dome/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if (player:getCurrentMission(player:getNation()) == 13 and player:hasKeyItem(MAGICITE_AURASTONE) == false) then
		if (player:getVar("MissionStatus") < 4) then
			player:startEvent(0x0000,1); -- play Lion part of the CS (this is first magicite)
		else
			player:startEvent(0x0000); -- don't play Lion part of the CS 
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
	
	if (csid == 0x0000) then
		player:setVar("MissionStatus",4);
		player:addKeyItem(MAGICITE_AURASTONE);
		player:messageSpecial(KEYITEM_OBTAINED,MAGICITE_AURASTONE);
	end
	
end;