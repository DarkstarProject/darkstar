-----------------------------------
--	Area: Windurst Waters
--	NPC:  Leepe-Hoppe
--	Starts Windurst Missions
--	Working ???% 
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/globals/keyitems");
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	-- Check if we are on Windurst Mission 1-3
	if(player:getCurrentMission(WINDURST) == THE_PRICE_OF_PEACE) then
		windurst_mission_1_3 = player:getVar("windurst_mission_1_3");
		if(windurst_mission_1_3 == 1) then
			if(player:hasKeyItem(FOOD_OFFERINGS) and player:hasKeyItem(DRINK_OFFERINGS)) then
				-- We already have the offerings, display instructions
				player:startEvent(0x8e);
			else
				-- We don't have the offerings yet
				player:startEvent(0x8c);
			end
		elseif(windurst_mission_1_3 == 2) then
			-- Keep displaying the instructions
			player:startEvent(0x8e);
		elseif(windurst_mission_1_3 == 3) then
			-- You're back from Giddeus
			player:startEvent(0x92);
			-- NOTE:
			-- I have no idea how to detect being in proximity
			-- of the npc around the same height, I'm assuming
			-- it's beingd one by onEventUpdate, which is
			-- called each time a char's stats get updated?
			--
			-- That right now seems to only happen when you
			-- touch a door or zone (to keep queries low?)
			-- So hence, I will have to make the player
			-- just talk to the NPC, which will trigger
			-- this cutscene
		end
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
	-- Check if we are on Windurst Mission 1-3
	if(csid == 0x8c) then
		windurst_mission_1_3 = player:getVar("windurst_mission_1_3");
		if(windurst_mission_1_3 == 1) then
			-- Get the key Food Offering
			player:addKeyItem(FOOD_OFFERINGS);
			player:messageSpecial(KEYITEM_OBTAINED,FOOD_OFFERINGS);
			player:addKeyItem(DRINK_OFFERINGS);
			player:messageSpecial(KEYITEM_OBTAINED,DRINK_OFFERINGS);
			-- Set the progress
			if(player:hasKeyItem(FOOD_OFFERINGS) and player:hasKeyItem(DRINK_OFFERINGS)) then
				player:setVar("windurst_mission_1_3",2);
				player:setVar("food_offering_delivered",1);
				player:setVar("drink_offering_delivered",1);
			end
		end
	elseif(csid == 0x92) then
		-- Set Mission Progress
		player:setVar("windurst_mission_1_3",4);
	end
end;




