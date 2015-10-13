-----------------------------------
-- Area: La Theine Plateau
-- NPC:  Cermet Headstone
-- Involved in Mission: ZM5 Headstone Pilgrimage (Water Fragment)
-- @pos -170 39 -504 102
-----------------------------------
package.loaded["scripts/zones/La_Theine_Plateau/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/missions");
require("scripts/zones/La_Theine_Plateau/TextIDs");

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
		if (player:hasKeyItem(WATER_FRAGMENT) == false) then
			player:startEvent(0x00C8,WATER_FRAGMENT);
		elseif (player:hasKeyItem(239) and player:hasKeyItem(240) and player:hasKeyItem(241) and 
			player:hasKeyItem(242) and player:hasKeyItem(243) and player:hasKeyItem(244) and 
			player:hasKeyItem(245) and player:hasKeyItem(246)) then
			player:messageSpecial(ALREADY_HAVE_ALL_FRAGS);				
		elseif (player:hasKeyItem(WATER_FRAGMENT) == true) then
			player:messageSpecial(ALREADY_OBTAINED_FRAG,WATER_FRAGMENT);
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
		player:addKeyItem(WATER_FRAGMENT);
		-- Check and see if all fragments have been found (no need to check earth and dark frag)
		if (player:hasKeyItem(FIRE_FRAGMENT) and player:hasKeyItem(EARTH_FRAGMENT) and player:hasKeyItem(ICE_FRAGMENT) and 
		   player:hasKeyItem(WIND_FRAGMENT) and player:hasKeyItem(LIGHTNING_FRAGMENT) and player:hasKeyItem(LIGHT_FRAGMENT)) then
			player:messageSpecial(FOUND_ALL_FRAGS,WATER_FRAGMENT);
			player:addTitle(BEARER_OF_THE_EIGHT_PRAYERS);
			player:completeMission(ZILART,HEADSTONE_PILGRIMAGE);
			player:addMission(ZILART,THROUGH_THE_QUICKSAND_CAVES);
		else
			player:messageSpecial(KEYITEM_OBTAINED,WATER_FRAGMENT);
		end
	end
	
end;