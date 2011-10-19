-----------------------------------
-- Area: Bastok Markets
-- NPC: Gwill
-- Starts & Ends Quest: The Return of the Adventurer (100%)
-- Optional Involvement in Quest: The Cold Light of Day
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

 count = trade:getItemCount();
 Cinnamon = trade:hasItemQty(628,1);
 FreeSlot = player:getFreeSlotsCount();

	if (Cinnamon == true and count == 1) then
		TheReturn = player:getQuestStatus(BASTOK,THE_RETURN_OF_THE_ADVENTURER);
		if (TheReturn == 1 and FreeSlot >= 1) then
			player:tradeComplete();
			player:completeQuest(BASTOK,THE_RETURN_OF_THE_ADVENTURER);
			player:setTitle(93);
			player:startEvent(0x00f3);
		end	
	end

end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

pFame = player:getFameLevel(BASTOK);
FatherFigure = player:getQuestStatus(BASTOK,FATHER_FIGURE);
TheReturn = player:getQuestStatus(BASTOK,THE_RETURN_OF_THE_ADVENTURER);
TheColdLightofDay = player:getQuestStatus(BASTOK,THE_COLD_LIGHT_OF_DAY);

	if (FatherFigure == 2 and TheReturn == 0 and pFame >= 3) then
		player:startEvent(0x00f2);
	elseif (TheColdLightofDay == 1) then
		player:startEvent(0x0067);
	else
		player:startEvent(0x0071);
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

	if (csid == 0x00f2) then
		player:addQuest(BASTOK,THE_RETURN_OF_THE_ADVENTURER);
	elseif (csid == 0x00f3) then
		player:addItem(12498);
		player:addFame(BASTOK,BAS_FAME*120);
		player:messageSpecial(ITEM_OBTAINED,12498);
	end
	
end;




