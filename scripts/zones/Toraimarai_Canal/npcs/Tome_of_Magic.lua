-----------------------------------
-- Area: Toraimarai Canal
-- NPC:  Tome of Magic ( Needed for Mission )
-- Involved In Windurst Mission 7-1
-- @zone 169
-- @pos 142 13 -13 169 <many>
-----------------------------------
package.loaded["scripts/zones/Toraimarai_Canal/TextIDs"] = nil;
require("scripts/zones/Toraimarai_Canal/TextIDs");
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/missions");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

local CurrentMission = player:getCurrentMission(WINDURST);
local WindyKills = player:getVar("Windurst_7-1Kills");
local npcId = npc:getID();

	if(npcId == 17469825) then
		if(CurrentMission == THE_SIXTH_MINISTRY and WindyKills == 4 and MissionStatus == 1) then
			player:startEvent(0x0045);
		end
				
	else
		local cs = math.random(0x041,0x044);
		player:startEvent(cs);
		
	end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);

end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

	if (csid == 0x0045) then
		player:setVar("MissionStatus",2);
	end
end;