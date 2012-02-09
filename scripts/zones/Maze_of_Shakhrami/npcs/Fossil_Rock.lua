-----------------------------------
-- Area: Maze of Shakhrami
-- NPC:  Fossil Rock
-- Used in Mission: Windurst Mission 2-1
-- @zone 198
-----------------------------------

package.loaded["scripts/zones/Maze_of_Shakhrami/TextIDs"] = nil;
require("scripts/zones/Maze_of_Shakhrami/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if(player:getCurrentMission(WINDURST) == LOST_FOR_WORDS) then
		windurst_mission_2_1 = player:getVar("windurst_mission_2_1");
		if(windurst_mission_2_1 >= 3) then
			-- Get the value of the randomly selected fossil
			random_value = player:getVar("wm_2_1_randfoss");
			npc_id = npc:getID();
			
			if(npc_id == random_value) then
				if(windurst_mission_2_1 == 3) then
					-- Get the keyitem and head back to Nanaa
					player:addKeyItem(LAPIS_CORAL);
					player:messageSpecial(KEYITEM_OBTAINED,LAPIS_CORAL);
					player:setVar("windurst_mission_2_1",4);
				else
					-- Already removed the fossil
					player:messageSpecial(FOSSIL_EXTRACTED);
				end
			else
				player:messageSpecial(NOTHING_FOSSIL);
			end
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
end;