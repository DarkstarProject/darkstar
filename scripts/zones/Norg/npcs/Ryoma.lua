-----------------------------------
-- Area: Norg
-- NPC:  Ryoma
-- Involved in Quest: Ayame and Kaede, 20 in Pirate Years
-- @zone 252
-- @pos -23 0 -9
-----------------------------------
package.loaded["scripts/zones/Norg/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Norg/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	twentyInPirateYears = player:getQuestStatus(OUTLANDS,TWENTY_IN_PIRATE_YEARS);
	
	mLvl = player:getMainLvl();
	mJob = player:getMainJob();
	
	if(player:getQuestStatus(BASTOK,AYAME_AND_KAEDE) == QUEST_ACCEPTED) then
		if(player:getVar("AyameAndKaede_Event") == 3) then
			player:startEvent(0x005f);
		else
			player:startEvent(0x005e);
		end
	elseif(twentyInPirateYears == QUEST_AVAILABLE and mJob == 13 and mLvl >= 40) then
		player:startEvent(0x0085);
	elseif(twentyInPirateYears == QUEST_ACCEPTED and player:hasKeyItem(TRICK_BOX)) then
		player:startEvent(0x0086);
	elseif(twentyInPirateYears == QUEST_COMPLETED) then
		player:startEvent(0x0087);
	else
		player:startEvent(0x005e);
	end
	
end;
--0x00af  0x005e  0x005f  0x0085  0x0086  0x0087  0x0088  0x0089  0x008a  0x00b8  0x00b9  0x00ba  0x00bb  0x00bc  0x00bd
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

	if(csid == 0x005f) then
		player:addKeyItem(SEALED_DAGGER);
		player:messageSpecial(KEYITEM_OBTAINED, SEALED_DAGGER);
		player:delKeyItem(STRANGELY_SHAPED_CORAL);
		player:setVar("AyameAndKaede_Event", 4);
	elseif(csid == 0x0085) then
		player:addQuest(OUTLANDS,TWENTY_IN_PIRATE_YEARS);
		player:setVar("twentyInPirateYearsCS",1);
	elseif(csid == 0x0086) then
		if(player:getFreeSlotsCount() <= 1) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17771);
		else
			player:delKeyItem(TRICK_BOX);
			player:addItem(17771);
			player:addItem(17772);
			player:messageSpecial(ITEM_OBTAINED, 17771); -- Anju 
			player:messageSpecial(ITEM_OBTAINED, 17772); -- Zushio
			player:setVar("twentyInPirateYearsCS",0);
			player:addFame(OUTLANDS,NORG_FAME*30);
			player:completeQuest(OUTLANDS,TWENTY_IN_PIRATE_YEARS);	
		end
	end
	
end;