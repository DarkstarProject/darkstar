-----------------------------------
--	Area: Inner Horutoto Ruins
--	NPC:  Ancient Magical Gizmo #6 (J out of E, F, G, H, I, J)
--  Involved In Mission: The Heart of the Matter
-----------------------------------
package.loaded["scripts/zones/Outer_Horutoto_Ruins/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
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
	
	-- Check if we are on Windurst Mission 1-2
	if (player:getCurrentMission(WINDURST) == THE_HEART_OF_THE_MATTER) then
		MissionStatus = player:getVar("MissionStatus");
		
		if (MissionStatus == 2) then
			-- Entered a Dark Orb
			if (player:getVar("MissionStatus_orb6") == 1) then
				player:startEvent(0x0033);
			else
				player:messageSpecial(ORB_ALREADY_PLACED);
			end
		elseif (MissionStatus == 4) then
			-- Took out a Glowing Orb
			if (player:getVar("MissionStatus_orb6") == 2) then
				player:startEvent(0x0033);
			else
				player:messageSpecial(G_ORB_ALREADY_GOTTEN);
			end
		else
			player:messageSpecial(DARK_MANA_ORB_RECHARGER);
		end
	else
		player:messageSpecial(DARK_MANA_ORB_RECHARGER);
	end
	return 1;
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
	
	if (csid == 0x0033) then
		orb_value = player:getVar("MissionStatus_orb6");
		
		if (orb_value == 1) then
			player:setVar("MissionStatus_orb6",2);
			-- Push the text that the player has placed the orb
			player:messageSpecial(SIXTH_DARK_ORB_IN_PLACE);
			--Delete the key item
			player:delKeyItem(SIXTH_DARK_MANA_ORB);
			
			-- Check if all orbs have been placed or not
			if (player:getVar("MissionStatus_orb1") == 2 and 
			   player:getVar("MissionStatus_orb2") == 2 and 
			   player:getVar("MissionStatus_orb3") == 2 and 
			   player:getVar("MissionStatus_orb4") == 2 and 
			   player:getVar("MissionStatus_orb5") == 2) then
				player:messageSpecial(ALL_DARK_MANA_ORBS_SET);
				player:setVar("MissionStatus",3);
			end
		elseif (orb_value == 2) then
			player:setVar("MissionStatus_orb6",3);
			-- Time to get the glowing orb out
			player:addKeyItem(SIXTH_GLOWING_MANA_ORB);
			player:messageSpecial(KEYITEM_OBTAINED,SIXTH_GLOWING_MANA_ORB);
			
			-- Check if all orbs have been placed or not
			if (player:getVar("MissionStatus_orb1") == 3 and 
			   player:getVar("MissionStatus_orb2") == 3 and 
			   player:getVar("MissionStatus_orb3") == 3 and 
			   player:getVar("MissionStatus_orb4") == 3 and 
			   player:getVar("MissionStatus_orb5") == 3) then
				player:messageSpecial(RETRIEVED_ALL_G_ORBS);
				player:setVar("MissionStatus",5);
			end
		end
	end
	
end;