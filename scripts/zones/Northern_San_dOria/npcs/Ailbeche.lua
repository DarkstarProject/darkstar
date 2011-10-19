-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Ailbeche
-- NPC for "Father and Son" Quest
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Northern_San_dOria/TextIDs");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	-- "Flyers for Regine" conditional script
	FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);
	-- "Father and Son" quest status
	fatherAndSon = player:getQuestStatus(SANDORIA, FATHER_AND_SON);
	
	if (fatherAndSon == QUEST_COMPLETED) then
		count = trade:getItemCount();
		hasWillowFishingRod = trade:hasItemQty(17391,1);
		if (hasWillowFishingRod and count == 1) then
			player:tradeComplete();
			player:startEvent(0x003d);
			player:setVar("returnedAilbecheRod",1);
		end;
	end;
		
	
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

	-- "Father and Son" quest status
	fatherAndSon = player:getQuestStatus(SANDORIA, FATHER_AND_SON);
	-- "Sharpening the Sword) Quest Status
	sharpeningTheSword = player:getQuestStatus(SANDORIA, SHARPENING_THE_SWORD);
	-- Checking levels and jobs for af quest
	mLvl = player:getMainLvl();
	mJob = player:getMainJob();
	-- Check if they have key item "Ordelle whetstone"
	hasOrdelleWhetstone = player:hasKeyItem(233)
	
	--"Father and Son" Event Dialogs
	if (fatherAndSon == QUEST_AVAILABLE and player:getVar("fatherAndSonCS") == 0) then
		player:startEvent(0x01fc);
		player:setVar("fatherAndSonCS",1);
		player:addQuest(SANDORIA, FATHER_AND_SON);
	elseif (fatherAndSon == QUEST_ACCEPTED and player:getVar("fatherAndSonCS1") == 1) then
		player:startEvent(0x01fd);
	
	--[[ "Sharpening the Sword" Quest Dialogs	
	elseif (player:getVar("sharpeningTheSwordCS") == 1 and sharpeningTheSword == QUEST_AVAILABLE and mJob == 7 and mLvl >= 40) then
		player:startEvent(0x002b);
		player:setVar("fatherAndSonCS2",1);
	elseif (player:getVar("returnedAilbecheRod") == 1 and sharpeningTheSword == QUEST_AVAILABLE and fatherAndSon == QUEST_COMPLETED and mJob == 7 and mLvl >= 40) then
		player:startEvent(0x002d);
		player:setVar("sharpeningTheSwordCS",1);
	elseif (sharpeningTheSword == QUEST_ACCEPTED) then
		player:startEvent(0x002a);
	elseif (hasOrdelleWhetstone == true) then
		player:startEvent(0x002c);
	--]]
		
	-- "Father and Son" Completed Event Dialogs
	elseif (fatherAndSon == QUEST_COMPLETED and player:getVar("returnedAilbecheRod") == 1) then
		player:startEvent(0x000c);
	else
		player:startEvent(0x0364);
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

	-- "Faher and Son" recieve willow fishing rod
	if (csid == 0x01fd and player:getFreeSlotsCount() > 0) then
		player:addItem(17391);
		player:messageSpecial(6567, 17391);
		player:addFame(SANDORIA, SAN_FAME*30);
		player:setTitle(LOST_CHILD_OFFICER);
		player:completeQuest(SANDORIA, FATHER_AND_SON);
	elseif (csid == 0x01fd and player:getFreeSlotsCount() < 1) then
		player:messageSpecial(6564, 17391); -- CANNOT_OBTAIN_ITEM
	end;
	
	--[[ "Sharpening the Sword" Start Quest
	if (csid == 0x002d and option == 0) then
		player:addQuest(SANDORIA, SHARPENING_THE_SWORD);
	end
	if (csid == 0x002b and option == 0) then
		player:addQuest(SANDORIA, SHARPENING_THE_SWORD);
	end
	-- "Sharpening the Sword" recieve honor sword
	if (csid == 0x002c and player:getFreeSlotsCount() > 0 and player:hasItem(17643) == false) then
		player:addItem(17643);
		player:messageSpecial(6567, 17643);
		player:addFame(SANDORIA, SAN_FAME*30);
		player:completeQuest(SANDORIA, SHARPENING_THE_SWORD);
		player:delKeyItem(233);
	elseif (player:getFreeSlotsCount() < 1 or player:hasItem(17643) == true) then
		player:messageSpecial(6564, 17643); -- CANNOT_OBTAIN_ITEM
	end;
	--]]
	
	
end;




