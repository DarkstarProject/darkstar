-----------------------------------
-- Area: Cape Teriggan
-- NPC:  Cermet Headstone
-- Involved in Mission: ZM5 Headstone Pilgrimage (Wind Headstone)
-- @pos -107 -8 450 113
-----------------------------------
package.loaded["scripts/zones/Cape_Teriggan/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/missions");
require("scripts/zones/Cape_Teriggan/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if (trade:hasItemQty(949,1) and trade:getItemCount() == 1) then
		if (player:getCurrentMission(ZILART) == HEADSTONE_PILGRIMAGE and player:hasKeyItem(WIND_FRAGMENT) and player:hasCompleteQuest(OUTLANDS,WANDERING_SOULS) == false) then
			 player:addQuest(OUTLANDS,WANDERING_SOULS);
			 player:startEvent(0x00CA,949);
		elseif (player:hasCompletedMission(ZILART,HEADSTONE_PILGRIMAGE) and player:hasCompleteQuest(OUTLANDS,WANDERING_SOULS) == false) then 	 
			 player:addQuest(OUTLANDS,WANDERING_SOULS);
			 player:startEvent(0x00CA,949);
		else
			 player:messageSpecial(NOTHING_HAPPENS);	 
		end	 
	end	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if (player:getCurrentMission(ZILART) == HEADSTONE_PILGRIMAGE) then
		-- if requirements are met and 15 mins have passed since mobs were last defeated, spawn them
		if (player:hasKeyItem(WIND_FRAGMENT) == false and GetServerVariable("[ZM4]Wind_Headstone_Active") < os.time()) then
			player:startEvent(0x00C8,WIND_FRAGMENT);
		-- if 15 min window is open and requirements are met, recieve key item
		elseif (player:hasKeyItem(WIND_FRAGMENT) == false and GetServerVariable("[ZM4]Wind_Headstone_Active") > os.time()) then
			player:addKeyItem(WIND_FRAGMENT);
			-- Check and see if all fragments have been found (no need to check wind and dark frag)
			if (player:hasKeyItem(ICE_FRAGMENT) and player:hasKeyItem(EARTH_FRAGMENT) and player:hasKeyItem(WATER_FRAGMENT) and 
			   player:hasKeyItem(FIRE_FRAGMENT) and player:hasKeyItem(LIGHTNING_FRAGMENT) and player:hasKeyItem(LIGHT_FRAGMENT)) then
				player:messageSpecial(FOUND_ALL_FRAGS,WIND_FRAGMENT);
				player:addTitle(BEARER_OF_THE_EIGHT_PRAYERS);
				player:completeMission(ZILART,HEADSTONE_PILGRIMAGE);
				player:addMission(ZILART,THROUGH_THE_QUICKSAND_CAVES);
			else
				player:messageSpecial(KEYITEM_OBTAINED,WIND_FRAGMENT);
			end
		else
			player:messageSpecial(ALREADY_OBTAINED_FRAG,WIND_FRAGMENT);
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
		SpawnMob(17240414,300):updateClaim(player); -- Axesarion the Wanderer
		SetServerVariable("[ZM4]Wind_Headstone_Active",0);
	elseif (csid == 0x00CA) then
		if (player:getFreeSlotsCount() == 0) then
			 player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13248);
		else	 
			player:tradeComplete();
			player:addItem(13248);		
			player:messageSpecial(ITEM_OBTAINED,13248);			
			player:completeQuest(OUTLANDS,WANDERING_SOULS);			
			player:addTitle(BEARER_OF_BONDS_BEYOND_TIME);	
		end			
	end	
end;