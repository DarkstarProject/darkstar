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
	if(player:getCurrentMission(WINDURST) == LOST_FOR_WORDS) then
		MissionStatus = player:getVar("MissionStatus");
		if(MissionStatus >= 2 and player:checkDistance(npc) <=2) then
				-- Get the value of the randomly selected fossil
				random_value = player:getVar("MissionStatus_randfoss");
				npc_id = npc:getID();
			
				if(npc_id == random_value) then
					if(MissionStatus == 2) then
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
		end
	
	elseif(player:getQuestStatus(WINDURST,BLAST_FROM_THE_PAST) == QUEST_ACCEPTED and GetMobAction(17588225) == 0 and player:hasItem(16511) == false) then
	--May need player:checkDistance() here too! -- Whasf
	if(xPos <= -88 and xPos >= -94 and yPos <= 17 and yPos >= 14 and zPos <= -99 and zPos >= -109) then
			SpawnMob(17588225);
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