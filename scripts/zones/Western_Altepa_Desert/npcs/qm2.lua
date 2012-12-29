-----------------------------------
-- Area: Western Altepa Desert
-- NPC:  ???
-- Involved in Mission: Bastok 6-1
-- @pos -325 0 -111 125
-----------------------------------
package.loaded["scripts/zones/Western_Altepa_Desert/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Western_Altepa_Desert/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(player:getCurrentMission(BASTOK) == RETURN_OF_THE_TALEKEEPER and player:getVar("MissionStatus") == 2) then
		if(GetMobAction(17289654) == 0 and GetMobAction(17289655) == 0) then
			if(player:getVar("Mission6-1MobKilled") >= 1) then
				player:addKeyItem(ALTEPA_MOONPEBBLE);
				player:messageSpecial(KEYITEM_OBTAINED,ALTEPA_MOONPEBBLE);
				player:setVar("Mission6-1MobKilled",0);
				player:setVar("MissionStatus",3);
			else
				SpawnMob(17289654):updateEnmity(player);
				SpawnMob(17289655):updateEnmity(player);
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
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	
	if(csid == 0x00C8 and option == 1) then
		player:addKeyItem(EARTH_FRAGMENT);
		-- Check and see if all fragments have been found (no need to check earth and dark frag)
		if(player:hasKeyItem(FIRE_FRAGMENT) and player:hasKeyItem(WATER_FRAGMENT) and player:hasKeyItem(ICE_FRAGMENT) and 
		   player:hasKeyItem(WIND_FRAGMENT) and player:hasKeyItem(LIGHTNING_FRAGMENT) and player:hasKeyItem(LIGHT_FRAGMENT)) then
			player:messageSpecial(FOUND_ALL_FRAGS,EARTH_FRAGMENT);
			player:addTitle(BEARER_OF_THE_EIGHT_PRAYERS);
			player:completeMission(ZILART,HEADSTONE_PILGRIMAGE);
			player:addMission(ZILART,THROUGH_THE_QUICKSAND_CAVES);
		else
			player:messageSpecial(KEYITEM_OBTAINED,EARTH_FRAGMENT);
		end
	end
	
end;