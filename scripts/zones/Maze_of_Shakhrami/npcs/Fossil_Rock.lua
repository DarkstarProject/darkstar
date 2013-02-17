-----------------------------------
-- Area: Maze of Shakhrami
-- NPC:  Fossil Rock
-- Used in Mission: Windurst Mission 2-1
-- @pos 17 18 184 198 + <many pos>
-----------------------------------
package.loaded["scripts/zones/Maze_of_Shakhrami/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/globals/quests");
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
	local xPos = player:getXPos();
	local yPos = player:getYPos();
	local zPos = player:getZPos();
	local npc_id = npc:getID();
	local LostForWords_Status = player:getVar("MissionStatus");

	if(player:getCurrentMission(WINDURST) == LOST_FOR_WORDS and npc_id ~= 17588742 and LostForWords_Status >= 2) then
		-- Get the value of the randomly selected fossil
		local random_value = player:getVar("MissionStatus_randfoss");

		if(npc_id == random_value) then
			if(LostForWords_Status == 2) then
				player:setVar("MissionStatus",3);
				player:setVar("MissionStatus_randfoss",0);
				player:addKeyItem(LAPIS_CORAL);
				player:messageSpecial(KEYITEM_OBTAINED,LAPIS_CORAL);
			else
				-- Already removed the fossil
				player:messageSpecial(FOSSIL_EXTRACTED);
			end
		else
			player:messageSpecial(NOTHING_FOSSIL);
		end

	elseif(npc_id == 17588742) then
		if(player:getQuestStatus(WINDURST,BLAST_FROM_THE_PAST) == QUEST_ACCEPTED and GetMobAction(17588225) == 0 and player:hasItem(16511) == false) then
			SpawnMob(17588225);
		else
			player:messageSpecial(FOSSIL_EXTRACTED + 2); -- NM spawn point message.
		end
	else -- Player has no reason to examine them at this point, but still should receive feedback.
		player:messageSpecial(NOTHING_FOSSIL);
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