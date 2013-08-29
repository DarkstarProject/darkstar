-----------------------------------
-- Area: Kuftal Tunnel
-- NPC:  ???
-- Involved in Mission: Bastok 8-2
-- @pos -27 -10 -185 32
-----------------------------------
package.loaded["scripts/zones/Kuftal_Tunnel/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Kuftal_Tunnel/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local missionStatus = player:getVar("MissionStatus");

	if(player:getCurrentMission(BASTOK) == ENTER_THE_TALEKEEPER and player:getVar("MissionStatus") == 1) then
		if(GetMobAction(17489928) == 0 and GetMobAction(17489927) == 0 and GetMobAction(17489926) == 0) then
			if(player:getVar("Mission8-2MobKilled") >= 1) then
				player:setVar("Mission8-2MobKilled",0);
				player:startEvent(0x00D);
			else				
				SpawnMob(17489926, 120):updateEnmity(player);
				SpawnMob(17489927, 120):updateEnmity(player);
				SpawnMob(17489928, 120):updateEnmity(player);
			end
		end
	else
		player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
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
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
	
	if(csid == 0x00D) then
		player:setVar("MissionStatus",2);
		player:setVar("Mission8-2WoodFell",0);
		player:addKeyItem(OLD_PIECE_OF_WOOD);
		player:messageSpecial(KEYITEM_OBTAINED,OLD_PIECE_OF_WOOD);
	end
	
end;