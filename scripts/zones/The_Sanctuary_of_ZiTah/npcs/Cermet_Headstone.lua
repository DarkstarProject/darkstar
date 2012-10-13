-----------------------------------
-- Area: The Sanctuary of Zi'Tah
-- NPC:  Cermet Headstone
-- Involved in Mission: ZM5 Headstone Pilgrimage (Light Headstone)
-- @pos 235 0 280 121
-----------------------------------
package.loaded["scripts/zones/The_Sanctuary_of_ZiTah/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/missions");
require("scripts/zones/The_Sanctuary_of_ZiTah/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(player:getCurrentMission(ZILART) == HEADSTONE_PILGRIMAGE) then
		-- if requirements are met and 15 mins have passed since mobs were last defeated, spawn them
		if(player:hasKeyItem(LIGHT_FRAGMENT) == false and GetServerVariable("[ZM4]Light_Headstone_Active") < os.time()) then
			player:startEvent(0x00C8,LIGHT_FRAGMENT);
		-- if 15 min window is open and requirements are met, recieve key item
		elseif(player:hasKeyItem(LIGHT_FRAGMENT) == false and GetServerVariable("[ZM4]Light_Headstone_Active") > os.time()) then
			player:addKeyItem(LIGHT_FRAGMENT);
			-- Check and see if all fragments have been found (no need to check wind and dark frag)
			if(player:hasKeyItem(ICE_FRAGMENT) and player:hasKeyItem(EARTH_FRAGMENT) and player:hasKeyItem(WATER_FRAGMENT) and 
			   player:hasKeyItem(FIRE_FRAGMENT) and player:hasKeyItem(LIGHTNING_FRAGMENT) and player:hasKeyItem(WIND_FRAGMENT)) then
				player:messageSpecial(FOUND_ALL_FRAGS,LIGHT_FRAGMENT);
				player:addTitle(BEARER_OF_THE_EIGHT_PRAYERS);
				player:completeMission(ZILART,HEADSTONE_PILGRIMAGE);
				player:addMission(ZILART,THROUGH_THE_QUICKSAND_CAVES);
			else
				player:messageSpecial(KEYITEM_OBTAINED,LIGHT_FRAGMENT);
			end
		else
			player:messageSpecial(ALREADY_OBTAINED_FRAG,LIGHT_FRAGMENT);
		end
	elseif(player:hasCompletedMission(ZILART,HEADSTONE_PILGRIMAGE)) then
		player:messageSpecial(ZILART_MONUMENT);
	else
		player:messageSpecial(CANNOT_REMOVE_FRAG);
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
		SpawnMob(17272839,300):updateEnmity(player); -- Doomed Pilgrims
		SetServerVariable("[ZM4]Light_Headstone_Active",0);
	end
	
end;