-----------------------------------
-- Area: Windurst Walls
-- NPC:  Nanaa Mihgo
-- Starts and Finishes Quest: Mihgo's Amigo (R), The Tenshodo Showdown (start)
-- Involved In Quest: Crying Over Onions
-- Involved in Mission 2-1
-- @pos 62 -4 240 241
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Windurst_Woods/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
   
	if(trade:hasItemQty(498,4) and trade:getItemCount() == 4) then -- Trade Yagudo Necklace x4
		
		MihgosAmigo = player:getQuestStatus(WINDURST,MIHGO_S_AMIGO);
		
		if(MihgosAmigo == QUEST_ACCEPTED) then	
			player:startEvent(0x0058,GIL_RATE*200);
		elseif(MihgosAmigo == QUEST_COMPLETED) then
			player:startEvent(0x01ee,GIL_RATE*200);
		end
	end
   
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	-- Check for Missions first (priority?)
	if(player:getCurrentMission(WINDURST) == LOST_FOR_WORDS) then
		MissionStatus = player:getVar("MissionStatus");
		if(MissionStatus == 1) then
			player:startEvent(0x00a5,0,LAPIS_CORAL,LAPIS_MONOCLE);
		elseif(MissionStatus == 2) then
			player:startEvent(0x00a6,0,LAPIS_CORAL,LAPIS_MONOCLE);
		elseif(MissionStatus == 3) then
			player:startEvent(0x00a9);
		else
			player:startEvent(0x00aa);
		end
	else
		CryingOverOnionsVar = player:getVar("CryingOverOnions");
		MihgosAmigo = player:getQuestStatus(WINDURST,MIHGO_S_AMIGO);
		theTenshodoShowdown = player:getQuestStatus(WINDURST,THE_TENSHODO_SHOWDOWN);
		theTenshodoShowdownCS = player:getVar("theTenshodoShowdownCS");
		
		LvL = player:getMainLvl();
		Job = player:getMainJob();
		
		AF_BYPASS = (Job ~= 6 or Job == 6 and LvL < 40);
		
		-- Optional CS of the quest "Crying Over Onions"
		if(CryingOverOnionsVar == 1) then
			player:startEvent(0x0256);
			
		-- Quest "Mihgo's Amigo"
		elseif(MihgosAmigo == QUEST_AVAILABLE) then
			player:getQuestStatus(WINDURST,CRYING_OVER_ONIONS);
			
			if(CryingOverOnions ~= QUEST_AVAILABLE) then
				player:startEvent(0x0051); -- Start Quest "Mihgo's Amigo" with quest "Crying Over Onions" Activated
			else	
				player:startEvent(0x0050); -- Start Quest "Mihgo's Amigo"
			end
		elseif(AF_BYPASS and MihgosAmigo == QUEST_ACCEPTED) then
			player:startEvent(0x0052);
		elseif(AF_BYPASS and MihgosAmigo == QUEST_COMPLETED) then
			player:startEvent(0x0059);
		
		-- Quest "The Tenshodo Showdown"
		elseif(Job == 6 and LvL >= 40 and theTenshodoShowdown == QUEST_AVAILABLE) then 
			player:startEvent(0x01f0); -- Start Quest "The Tenshodo Showdown"
		elseif(theTenshodoShowdownCS == 1) then 
			player:startEvent(0x01f1); -- During Quest "The Tenshodo Showdown" (before cs at tensho HQ)
		elseif(theTenshodoShowdownCS >= 2) then
			player:startEvent(0x01f2); -- During Quest "The Tenshodo Showdown" (after cs at tensho HQ)
		elseif(Job == 6 and LvL < 50 and theTenshodoShowdown == QUEST_COMPLETED) then 
			player:startEvent(0x01f0); -- Standard dialog after "The Tenshodo Showdown"
		else
			player:startEvent(0x004c); -- Standard dialog
		end
	end
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	
	if(csid == 0x0050 or csid == 0x0051) then
		player:addQuest(WINDURST,MIHGO_S_AMIGO);
	elseif(csid == 0x0058) then
		player:tradeComplete();
		player:addGil(GIL_RATE*200);
		player:setTitle(CAT_BURGLAR_GROUPIE);
		player:needToZone(true);
		player:addFame(NORG,NORG_FAME*60);
		player:completeQuest(WINDURST,MIHGO_S_AMIGO);
	elseif(csid == 0x01ee) then
		player:tradeComplete();
		player:addGil(GIL_RATE*200);
		player:addFame(NORG,NORG_FAME*8);
	elseif(csid == 0x01f0) then
		player:addQuest(WINDURST,THE_TENSHODO_SHOWDOWN);
		player:setVar("theTenshodoShowdownCS",1);
		player:addKeyItem(LETTER_FROM_THE_TENSHODO);
		player:messageSpecial(KEYITEM_OBTAINED,LETTER_FROM_THE_TENSHODO);
	elseif(csid == 0x00a5 and option == 1) then -- Windurst Mission 2-1
		-- Add the key item for the mission
		player:addKeyItem(LAPIS_MONOCLE);
		player:messageSpecial(KEYITEM_OBTAINED,LAPIS_MONOCLE);
		-- Grab a random value to mark the correct fossil with
		selections = {17588734,17588738,17588739,17588740,17588742} -- Id's of the fossils that we have to examine
		random_value = math.random(1,5);
		player:setVar("MissionStatus_randfoss",selections[random_value]);
		-- Mark the progress
		player:setVar("MissionStatus",2);
	elseif(csid == 0x00a9) then -- Windurst Mission 2-1
		player:setVar("MissionStatus",4);
		player:delKeyItem(LAPIS_MONOCLE);
		player:delKeyItem(LAPIS_CORAL);
		player:addKeyItem(HIDEOUT_KEY);
		player:messageSpecial(KEYITEM_OBTAINED,HIDEOUT_KEY);
	end
	
end;