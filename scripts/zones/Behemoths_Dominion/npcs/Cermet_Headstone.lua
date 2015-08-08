-----------------------------------
-- Area: Behemoth's Dominion
-- NPC:  Cermet Headstone
-- Involved in Mission: ZM5 Headstone Pilgrimage (Lightning Headstone)
-- @pos -74 -4 -87 127
-----------------------------------
package.loaded["scripts/zones/Behemoths_Dominion/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/missions");
require("scripts/zones/Behemoths_Dominion/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if (player:getCurrentMission(ZILART) == HEADSTONE_PILGRIMAGE) then
		-- if requirements are met and 15 mins have passed since mobs were last defeated, spawn them
		if (player:hasKeyItem(LIGHTNING_FRAGMENT) == false and GetServerVariable("[ZM4]Lightning_Headstone_Active") < os.time()) then
			player:startEvent(0x00C8,LIGHTNING_FRAGMENT);
		-- if 15 min window is open and requirements are met, recieve key item
		elseif (player:hasKeyItem(LIGHTNING_FRAGMENT) == false and GetServerVariable("[ZM4]Lightning_Headstone_Active") > os.time()) then
			player:addKeyItem(LIGHTNING_FRAGMENT);
			-- Check and see if all fragments have been found (no need to check wind and dark frag)
			if (player:hasKeyItem(ICE_FRAGMENT) and player:hasKeyItem(EARTH_FRAGMENT) and player:hasKeyItem(WATER_FRAGMENT) and 
			   player:hasKeyItem(FIRE_FRAGMENT) and player:hasKeyItem(WIND_FRAGMENT) and player:hasKeyItem(LIGHT_FRAGMENT)) then
				player:messageSpecial(FOUND_ALL_FRAGS,LIGHTNING_FRAGMENT);
				player:addTitle(BEARER_OF_THE_EIGHT_PRAYERS);
				player:completeMission(ZILART,HEADSTONE_PILGRIMAGE);
				player:addMission(ZILART,THROUGH_THE_QUICKSAND_CAVES);
			else
				player:messageSpecial(KEYITEM_OBTAINED,LIGHTNING_FRAGMENT);
			end
		else
			player:messageSpecial(ALREADY_OBTAINED_FRAG,LIGHTNING_FRAGMENT);
		end
	elseif (player:hasCompletedMission(ZILART,HEADSTONE_PILGRIMAGE)) then
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
	
	if (csid == 0x00C8 and option == 1) then
		SpawnMob(17297450,300):updateClaim(player); -- Legendary Weapon
		SpawnMob(17297449,300):updateClaim(player); -- Ancient Weapon
		SetServerVariable("[ZM4]Lightning_Headstone_Active",0);
	end
	
end;