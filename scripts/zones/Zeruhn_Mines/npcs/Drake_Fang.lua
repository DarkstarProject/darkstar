-----------------------------------
-- Area: Zeruhn Mines
-- NPC:  Drake Fang
-- Involved in Mission: Bastok 6-1
-- @pos -74 0 58 172
-----------------------------------
package.loaded["scripts/zones/Zeruhn_Mines/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Zeruhn_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(player:getCurrentMission(BASTOK) == RETURN_OF_THE_TALEKEEPER and player:getVar("MissionStatus") >= 1) then
		if(player:getVar("MissionStatus") == 1) then
			player:startEvent(0x00c8);
		else
			player:startEvent(0x00c9);
		end
		
	else
		player:startEvent(0x006c);
	end
	
end;

-- 0x006c  0x00c8  0x00c9  0x00ca  0x00cb  0x00cc

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
	
	if(csid == 0x00c8) then
		player:setVar("MissionStatus",2);
	end
	
end;