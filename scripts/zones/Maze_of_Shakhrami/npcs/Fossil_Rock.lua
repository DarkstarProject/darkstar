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

	local X = player:getXPos();
	local Z = player:getZPos();
	local LostForWords_Status = player:getVar("MissionStatus");
	local randfoss = player:getVar("MissionStatus_randfoss");

	if ((LostForWords_Status == 2 or LostForWords_Status == 3) and (player:getCurrentMission(WINDURST) == LOST_FOR_WORDS)) then
		if ((randfoss == 0) or (randfoss > 6)) then -- added a check to clear out old NPC IDs set on the Variable
			local rand = math.random(1,6);
			player:setVar("MissionStatus_randfoss",rand);
		end
		
		if ((X > 33.739 and X < 45.739) and (Z > 205 and Z < 217)) then -- 39.739 19.024 211.796
			if (randfoss == 1) then
				if (player:hasKeyItem(LAPIS_CORAL) == false) then
					player:setVar("MissionStatus",3);
					player:addKeyItem(LAPIS_CORAL);
					player:messageSpecial(KEYITEM_OBTAINED,LAPIS_CORAL);
				else
					-- Already removed the fossil
					player:messageSpecial(FOSSIL_EXTRACTED);
				end
			else
				player:messageSpecial(NOTHING_FOSSIL);
			end
		elseif ((X > 121.608 and X < 133.608) and (Z > -133.815 and Z < -121.815)) then -- 127.608 18.585 -127.815
			if (randfoss == 2) then
				if (player:hasKeyItem(LAPIS_CORAL) == false) then
					player:setVar("MissionStatus",3);
					player:addKeyItem(LAPIS_CORAL);
					player:messageSpecial(KEYITEM_OBTAINED,LAPIS_CORAL);
				else 
					-- Already removed the fossil
					player:messageSpecial(FOSSIL_EXTRACTED);
				end
			else
				player:messageSpecial(NOTHING_FOSSIL);
			end
		elseif ((X > 127.568 and X < 139.568) and (Z > -73.296 and Z < -61.296)) then -- 133.568 18.164 -67.296
			if (randfoss == 3) then
				if (player:hasKeyItem(LAPIS_CORAL) == false) then
					player:setVar("MissionStatus",3);
					player:addKeyItem(LAPIS_CORAL);
					player:messageSpecial(KEYITEM_OBTAINED,LAPIS_CORAL);
				else 
					-- Already removed the fossil
					player:messageSpecial(FOSSIL_EXTRACTED);
				end
			else
				player:messageSpecial(NOTHING_FOSSIL);
			end
		elseif ((X > -17.161 and X < -5.161) and (Z > 153.821 and Z < 165.821)) then -- -11.161 19.183 159.821
			if (randfoss == 4) then
				if (player:hasKeyItem(LAPIS_CORAL) == false) then
					player:setVar("MissionStatus",3);
					player:addKeyItem(LAPIS_CORAL);
					player:messageSpecial(KEYITEM_OBTAINED,LAPIS_CORAL);
				else 
					-- Already removed the fossil
					player:messageSpecial(FOSSIL_EXTRACTED);
				end
			else
				player:messageSpecial(NOTHING_FOSSIL);
			end
		elseif ((X > 11.385 and X < 23.385) and (Z > 178.692 and Z < 190.692)) then -- 17.385 18.344 184.692
			if (randfoss == 5) then
				if (player:hasKeyItem(LAPIS_CORAL) == false) then
					player:setVar("MissionStatus",3);
					player:addKeyItem(LAPIS_CORAL);
					player:messageSpecial(KEYITEM_OBTAINED,LAPIS_CORAL);
				else
					-- Already removed the fossil
					player:messageSpecial(FOSSIL_EXTRACTED);
				end
			else
				player:messageSpecial(NOTHING_FOSSIL);
			end
		elseif ((X > 43.065 and X < 55.065) and (Z > 146.476 and Z < 158.476)) then -- 49.065 18.860 152.476
			if (randfoss == 6) then
				if (player:hasKeyItem(LAPIS_CORAL) == false) then
					player:setVar("MissionStatus",3);
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
		
	elseif ((X > -97.281 and X < -85.281) and (Z > -110.974 and Z < -98.974)) then -- f-8 map 2
		if (player:getQuestStatus(WINDURST,BLAST_FROM_THE_PAST) == QUEST_ACCEPTED and GetMobAction(17588225) == 0 and player:hasItem(16511) == false) then
			SpawnMob(17588225);
		else
			player:messageSpecial(FOSSIL_EXTRACTED + 2); -- NM spawn point message.
		end
	else
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