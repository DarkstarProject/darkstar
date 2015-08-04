-----------------------------------
-- Area: Lower Jeuno
-- NPC:  Zauko
-- Involved in Quests: Save the Clock Tower, Community Service
-- @zone 245
-- @pos -3 0 11
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
package.loaded["scripts/globals/settings"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Lower_Jeuno/TextIDs");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

----- Save The Clock Tower Quest -----
	if (trade:hasItemQty(555,1) == true and trade:getItemCount() == 1) then 
		a = player:getVar("saveTheClockTowerNPCz2"); -- NPC Zone2
		if (a == 0 or (a ~= 256 and a ~= 288 and a ~= 320 and a ~= 384 and a ~= 768 and a ~= 352 and a ~= 896 and a ~= 416 and 
		   a ~= 832 and a ~= 448 and a ~= 800 and a ~= 480 and a ~= 864 and a ~= 928 and a ~= 960 and a ~= 992)) then 
			player:startEvent(0x0032,10 - player:getVar("saveTheClockTowerVar")); -- "Save the Clock Tower" Quest
		end
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
local hour = VanadielHour();
local cService = player:getVar("cService");
questServerVar = GetServerVariable("[JEUNO]CommService");
----- Community Service Quest -----
-- The reason for all the Default Dialogue "else"s is because of all the different checks needed and to keep default dialogue
-- If they're not there then the player will keep triggering the Quest Complete (Repeat) Cutscene
-- Please leave them here unless you can find a way to fix this but the quest as it should do.


		-- Quest Start --
	if (player:getQuestStatus(JEUNO,COMMUNITY_SERVICE) == QUEST_AVAILABLE and player:getFameLevel(JEUNO) >=1) then
		if (hour >= 18 and hour < 21) then
			if (questServerVar == 0) then
				player:startEvent(0x0074,questServerVar+1); -- Quest Start Dialogue (NOTE: The Cutscene says somebody else is working on it but it still adds the quest)
			else
				player:startEvent(0x0074,questServerVar);
			end
		else
			player:startEvent(0x0076); -- Default Dialogue
		end

		-- Task Failed --
	elseif (player:getQuestStatus(JEUNO,COMMUNITY_SERVICE) == QUEST_ACCEPTED) then
		if (cService >= 1 and cService < 12 == true) then -- If the quest is accepted but all lamps are NOT lit
			if (hour >= 18 and hour < 23) then
				player:startEvent(0x0077); -- Task Failed Dialogue
			else 
				player:startEvent(0x0076);
			end	
			
		-- Quest Complete --
		else
			player:startEvent(0x0075); -- Quest Complete Dialogue
		end

		-- Repeat Quest --
	elseif (player:getQuestStatus(JEUNO,COMMUNITY_SERVICE) == QUEST_COMPLETED and cService == 18) then
		if (hour >= 18 and hour < 21) then
			player:startEvent(0x0074,1) -- Quest Start (Repeat)
		else
			player:startEvent(0x0076); -- Default Dialogue
		end

		-- Repeat Quest Task Failed --
	elseif (player:getQuestStatus(JEUNO,COMMUNITY_SERVICE) == QUEST_COMPLETED) then
		if (cService >= 14 and cService < 24 == true) then
			if (hour >= 18 and hour < 23) then -- If Quest Repeat is accepted but lamps are not lit
				player:startEvent(0x0077); -- Task Failed Dialogue
			end
		
		elseif (player:getQuestStatus(JEUNO,COMMUNITY_SERVICE) == QUEST_COMPLETED and cService == 0) then
			player:startEvent(0x0076);
			-- Repeat Quest Complete --
				else
					player:startEvent(0x0071); -- Quest Complete (Repeat)
		end
			

	else 
		player:startEvent(0x0076);
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
-- ClockTower Quest --	
	if (csid == 0x0032) then 
		player:setVar("saveTheClockTowerVar",player:getVar("saveTheClockTowerVar") + 1);
		player:setVar("saveTheClockTowerNPCz2",player:getVar("saveTheClockTowerNPCz2") + 256);
	
	---- Community Service Quest ----
	elseif (csid == 0x0074 and option == 0) then -- Quest Start
		if (questServerVar == 0) then
			player:addQuest(JEUNO,COMMUNITY_SERVICE);
			SetServerVariable("[JEUNO]CommService",1);
		end
		
	elseif (csid == 0x0075) then -- Quest Finish
		player:completeQuest(JEUNO,COMMUNITY_SERVICE);
		player:addFame(JEUNO,JEUNO_FAME*30);
		player:setVar("cService",13)
		player:addTitle(TORCHBEARER);
	
	elseif (csid == 0x0071) then -- Quest Finish (Repeat)
		player:addKeyItem(LAMP_LIGHTERS_MEMBERSHIP_CARD); -- Lamp Lighter's Membership Card
		player:messageSpecial(KEYITEM_OBTAINED,LAMP_LIGHTERS_MEMBERSHIP_CARD);
		player:addFame(JEUNO, JEUNO_FAME*15);
		player:setVar("cService",0);
	end
	
end;