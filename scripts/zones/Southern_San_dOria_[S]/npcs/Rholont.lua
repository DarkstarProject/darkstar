-----------------------------------
-- Area: Southern SandOria [S]
-- NPC: Rholont
-- @zone 80
-- @pos -168 -2 56
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria_[S]/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria_[S]/TextIDs");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if(player:getQuestStatus(CRYSTAL_WAR,GIFTS_OF_THE_GRIFFON) == QUEST_ACCEPTED and player:getVar("GiftsOfGriffonProg") == 1) then
		player:startEvent(0x017); -- Gifts of Griffon Start
		
	elseif (player:getQuestStatus(CRYSTAL_WAR,GIFTS_OF_THE_GRIFFON) == QUEST_ACCEPTED and player:getVar("GiftsOfGriffonProg") == 2 and player:getVar("GiftsOfGriffonPlumes") == 127) then
		player:startEvent(0x018); -- Gifts of Griffon Quest Complete

	elseif(player:getQuestStatus(CRYSTAL_WAR,CLAWS_OF_THE_GRIFFON) == QUEST_AVAILABLE and player:getQuestStatus(CRYSTAL_WAR,GIFTS_OF_THE_GRIFFON) == QUEST_COMPLETED and player:getMainLvl() >= 15) then
		player:startEvent(0x02F) -- Claws of Griffon Start
	else
		player:startEvent(0x020); -- Default Dialogue
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
	if(csid == 0x02F) then
		player:addQuest(CRYSTAL_WAR,CLAWS_OF_THE_GRIFFON);
	elseif (csid == 0x017) then
		if(player:getFreeSlotsCount() == 0) then
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,2528);
		else
			player:setVar("GiftsOfGriffonProg",2);
			player:addItem(2528,7); -- Plume d'or
			player:messageSpecial(ITEM_OBTAINED,2528);
		end
	
	elseif (csid == 0x018) then
		if(player:getFreeSlotsCount() == 0) then
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,812);
		else
			player:addItem(812,1)
			player:messageSpecial(ITEM_OBTAINED,812);
			player:setVar("GiftsOfGriffonProg",0);
			player:setVar("GiftsOfGriffonPlumes",0);
			player:completeQuest(CRYSTAL_WAR,GIFTS_OF_THE_GRIFFON);
		end
	end

end;