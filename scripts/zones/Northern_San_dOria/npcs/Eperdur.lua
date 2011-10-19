-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Eperdur
-- Finishes Quest: Altana's Sorrow
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

AltanaSorrow  = player:getQuestStatus(BASTOK,ALTANA_S_SORROW);
VirnageLetter = player:hasKeyItem(0xAE);

	if (AltanaSorrow == QUEST_ACCEPTED and VirnageLetter == true) then
		player:startEvent(0x02a7);
	else
		player:startEvent(0x02a6);
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

	if (csid == 0x02a7) then
		FreeSlots = player:getFreeSlotsCount();
		
		if (FreeSlots >= 1) then
			player:completeQuest(BASTOK,ALTANA_S_SORROW);
			player:delKeyItem(0xAE);
			player:addFame(BASTOK,BAS_FAME*200);
			player:setTitle(PILGRIM_TO_DEM);	
			player:addItem(SCROLL_OF_TELEPORT_DEM);
			player:messageSpecial(ITEM_OBTAINED,SCROLL_OF_TELEPORT_DEM);
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,SCROLL_OF_TELEPORT_DEM);
		end
	end
	
end;




