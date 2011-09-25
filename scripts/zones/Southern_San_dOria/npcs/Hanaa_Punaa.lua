-----------------------------------
--	Area: Southern San d'Oria
--	NPC: Hanaa Punaa
--  NPC for Quest "The Seamstress"
-------------------------------------

require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade)	
	
	-- "Flyers for Regine" conditional script
	FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);
	-- "The Seamstress" quest status
	theSteamStress = player:getQuestStatus(SANDORIA,THE_SEAMSTRESS);
	-- Checking "Lizard Skins" Quest Status
	lizardSkins = player:getQuestStatus(SANDORIA,LIZARD_SKINS);
	-- Checking "Black Tiger Skins" Quest Status
	blackTigerSkins = player:getQuestStatus(SANDORIA,BLACK_TIGER_SKINS);
	
		-- "Black Tiger Skins", Tiger Hide trade
	if (blackTigerSkins == QUEST_ACCEPTED) then
		count = trade:getItemCount();
		hasSheepskin = trade:hasItemQty(861,3);
		freeSlots = player:getFreeSlotsCount();
		if (freeSlots > 0 and hasSheepskin == true and count == 3) then
			player:tradeComplete();
			player:addFame(SANDORIA,SAN_FAME*30);
			player:setTitle(CAT_SKINNER);
			player:completeQuest(SANDORIA,BLACK_TIGER_SKINS);
			player:setVar("blkTigerSkin",0);
			player:startEvent(0x0241);
		elseif (freeSlots < 1) then
			player:messageSpecial(6402, 13119);
		end;
	end;
	
		-- "Lizard Skins", lizard skin trade
	if (lizardSkins == QUEST_ACCEPTED or lizardSkins == QUEST_COMPLETED) then
		count = trade:getItemCount();
		hasSheepskin = trade:hasItemQty(852,3);
		freeSlots = player:getFreeSlotsCount();
		if (freeSlots > 0 and hasSheepskin == true and count == 3) then
			player:tradeComplete();
			if (lizardSkins == QUEST_ACCEPTED) then
				player:addFame(SANDORIA,SAN_FAME*30);
				player:setTitle(LIZARD_SKINNER);
				player:completeQuest(SANDORIA,LIZARD_SKINS);
				player:setVar("lzdSkins",0);
			elseif (lizardSkins == QUEST_COMPLETED) then
				player:addFame(SANDORIA,SAN_FAME*5);
			end;
			player:startEvent(0x0231);
		elseif (freeSlots < 1) then
			player:messageSpecial(6402, 12697);
		end;
	end;
	
	-- "The Seamstress" , sheepskin trade
	if (theSteamStress == QUEST_ACCEPTED or theSteamStress == QUEST_COMPLETED) then
		count = trade:getItemCount();
		hasSheepskin = trade:hasItemQty(505,3);
		freeSlots = player:getFreeSlotsCount();
		if (freeSlots > 0 and hasSheepskin == true and count == 3) then
			player:tradeComplete();
			if (theSteamStress == QUEST_ACCEPTED) then
				player:addFame(SANDORIA,SAN_FAME*30);
				player:setTitle(SILENCER_OF_THE_LAMBS);
				player:completeQuest(SANDORIA,THE_SEAMSTRESS);
				player:setVar("theSeamStress",0);
			elseif (theSteamStress == QUEST_COMPLETED) then
				player:addFame(SANDORIA,SAN_FAME*5);
			end;
			player:startEvent(0x0212);
		elseif (freeSlots < 1) then
			player:messageSpecial(6402, 12696);
		end;
	end;
	
	-- "Flyers for Regine"
	if (FlyerForRegine == 1) then
		count = trade:getItemCount();
		MagicFlyer = trade:hasItemQty(MagicmartFlyer,1);
		if (MagicFlyer == true and count == 1) then
			player:messageSpecial(FLYER_REFUSED);
		end
	end
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 

	-- Checking "The Seamstress" Quest Status
	theSteamStress = player:getQuestStatus(SANDORIA,THE_SEAMSTRESS);
	-- Checking "Lizard Skins" Quest Status
	lizardSkins = player:getQuestStatus(SANDORIA,LIZARD_SKINS);
	-- Checking "Black Tiger Skins" Quest Status
	blackTigerSkins = player:getQuestStatus(SANDORIA,BLACK_TIGER_SKINS);

	-- Checking Fame Level
	sanFame = player:getFameLevel(SANDORIA);
		
	player:setFame(SANDORIA, 500);
	print(player:getFameLevel(SANDORIA));
		
	-- "Black Tiger Skins" Quest Dialogs
	if (blackTigerSkins == QUEST_AVAILABLE and player:getVar("blkTigerSkin") == 1 and sanFame >= 3 and theSteamStress == QUEST_COMPLETED and lizardSkins == QUEST_COMPLETED) then
		player:startEvent(0x0243 );
	elseif (blackTigerSkins == QUEST_AVAILABLE and sanFame >= 3 and theSteamStress == QUEST_COMPLETED and lizardSkins == QUEST_COMPLETED) then
		player:startEvent(0x0240);
		player:setVar("blkTigerSkin",1);
	elseif (blackTigerSkins == QUEST_ACCEPTED) then
		player:startEvent(0x0242);
	elseif (blackTigerSkins == QUEST_COMPLETED) then
		player:startEvent(0x0250);
	
	-- "Lizard Skins" Quest Dialogs
	elseif (lizardSkins == QUEST_AVAILABLE and player:getVar("lzdSkins") == 1 and sanFame >= 2 and theSteamStress == QUEST_COMPLETED) then
		player:startEvent(0x0232);
	elseif (lizardSkins == QUEST_AVAILABLE and sanFame >= 2 and theSteamStress == QUEST_COMPLETED) then
		player:startEvent(0x022f);
		player:setVar("lzdSkins",1);
	elseif (lizardSkins == QUEST_ACCEPTED) then
		player:startEvent(0x0230);
	elseif (lizardSkins == QUEST_COMPLETED) then
		player:startEvent(0x024f);
	
	-- "The Seamstress" Quest Dialogs
	elseif (theSteamStress == QUEST_AVAILABLE and player:getVar("theSeamStress") == 1) then
		player:startEvent(0x0213);
	elseif (theSteamStress == QUEST_AVAILABLE) then
		player:startEvent(0x0210);
		player:setVar("theSeamStress",1);
	elseif (theSteamStress == QUEST_ACCEPTED) then
		player:startEvent(0x0211);
	elseif (theSteamStress == QUEST_COMPLETED) then
		player:startEvent(0x024e);
	end;
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

	-- "The Seamstress" Quest
	if (csid == 0x0210 and option == 0) then
		player:addQuest(SANDORIA,THE_SEAMSTRESS);
	elseif (csid == 0x0213 and option == 0) then
		player:addQuest(SANDORIA,THE_SEAMSTRESS);
	elseif (csid == 0x0212) then
		player:addItem(12696);
		player:messageSpecial(6403,12696);
		
	-- "Liard Skins" Quest 
	elseif (csid == 0x022f and option == 0) then
		player:addQuest(SANDORIA,LIZARD_SKINS);
	elseif (csid == 0x0232 and option == 0) then
		player:addQuest(SANDORIA,LIZARD_SKINS);
	elseif (csid == 0x0231) then
		player:addItem(12697);
		player:messageSpecial(6403,12697);
		
	-- "Black Tiger Skins" Quest 
	elseif (csid == 0x0240 and option == 0) then
		player:addQuest(SANDORIA,BLACK_TIGER_SKINS);
	elseif (csid == 0x0243 and option == 0) then
		player:addQuest(SANDORIA,BLACK_TIGER_SKINS);
	elseif (csid == 0x0241) then
		player:addItem(13119);
		player:messageSpecial(6403,13119);
		
	end;
end;