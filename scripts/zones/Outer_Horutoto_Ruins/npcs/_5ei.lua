-----------------------------------
--	Area: Inner Horutoto Ruins
--	NPC:  Ancient Magical Gizmo #5 (I out of E, F, G, H, I, J)
--  Involved In Mission: The Heart of the Matter
--	Working ???%
-----------------------------------

package.loaded["scripts/zones/Outer_Horutoto_Ruins/TextIDs"] = nil;
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/zones/Outer_Horutoto_Ruins/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	magical_gizmo_no = 5; -- of the 6
	
	-- Check if we are on Windurst Mission 1-2
	if(player:getCurrentMission(WINDURST) == THE_HEART_OF_THE_MATTER) then
		windurst_mission_1_2 = player:getVar("windurst_mission_1_2");
		if(windurst_mission_1_2 == 2) then
			-- Entered a Dark Orb
			if(player:getVar("windy_miss_1_2_orb5") == 1) then
				player:startEvent(0x32);
				-- Set the progress
				player:setVar("windy_miss_1_2_orb5",2);
			else
				player:messageSpecial(ORB_ALREADY_PLACED);
			end
		elseif(windurst_mission_1_2 == 5) then
			-- Took out a Glowing Orb
			if(player:getVar("windy_miss_1_2_orb5") == 2) then
				player:startEvent(0x32);
				-- Set the progress
				player:setVar("windy_miss_1_2_orb5",3);
			else
				player:messageSpecial(G_ORB_ALREADY_GOTTEN);
			end
		else
			player:messageSpecial(DARK_MANA_ORB_RECHARGER);
		end
	else
		player:messageSpecial(DARK_MANA_ORB_RECHARGER);
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

	-- If we just finished the cutscene for Windurst Mission 1-2
	-- Entered an orb
	if(csid == 0x32) then
		orb_value = player:getVar("windy_miss_1_2_orb5");
		if(orb_value == 2) then
			-- Push the text that the player has placed the orb
			player:messageSpecial(FIFTH_DARK_ORB_IN_PLACE);
			--Delete the key item
			player:delKeyItem(FIFTH_DARK_MANA_ORB);
			
			-- Check if all orbs have been placed or not
			orb1 = player:getVar("windy_miss_1_2_orb1");
			orb2 = player:getVar("windy_miss_1_2_orb2");
			orb3 = player:getVar("windy_miss_1_2_orb3");
			orb4 = player:getVar("windy_miss_1_2_orb4");
			orb5 = player:getVar("windy_miss_1_2_orb5");
			orb6 = player:getVar("windy_miss_1_2_orb6");
			if(orb1 == 2 and orb2 == 2 and orb3 == 2 and orb4 == 2 and orb5 == 2 and orb6 == 2) then
				player:messageSpecial(ALL_DARK_MANA_ORBS_SET);
				player:setVar("windurst_mission_1_2",4);
			end
		elseif(orb_value == 3) then
			-- Time to get the glowing orb out
			player:addKeyItem(FIFTH_GLOWING_MANA_ORB);
			-- Display the key item messages
			player:messageSpecial(KEYITEM_OBTAINED,FIFTH_GLOWING_MANA_ORB);
			-- Set the orb variables; 1 = not handled; 2 = handled;
			player:setVar("windy_miss_1_2_orb5",3);
			
			-- Check if all orbs have been placed or not
			orb1 = player:getVar("windy_miss_1_2_orb1");
			orb2 = player:getVar("windy_miss_1_2_orb2");
			orb3 = player:getVar("windy_miss_1_2_orb3");
			orb4 = player:getVar("windy_miss_1_2_orb4");
			orb5 = player:getVar("windy_miss_1_2_orb5");
			orb6 = player:getVar("windy_miss_1_2_orb6");
			if(orb1 == 3 and orb2 == 3 and orb3 == 3 and orb4 == 3 and orb5 == 3 and orb6 == 3) then
				player:messageSpecial(RETRIEVED_ALL_G_ORBS);
				player:setVar("windurst_mission_1_2",6);
			end
		end
	end
end;




