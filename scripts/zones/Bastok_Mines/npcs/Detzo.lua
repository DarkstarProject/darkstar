-----------------------------------
-- Area: Bastok Mines
-- NPC: Detzo
-- Starts & Finishes Quest: Rivals
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

Rivals = player:getQuestStatus(BASTOK,RIVALS);

	if (Rivals == QUEST_ACCEPTED) then
		FreeSlots = player:getFreeSlotsCount();
		
		if (FreeSlots >= 1) then
			count = trade:getItemCount();
			MythrilSallet = trade:hasItemQty(12417,1);

			if (MythrilSallet == true and count == 1) then
				-- You retain the Mythril Sallet after trading it to Detzo
				player:startEvent(0x005e);
			end
		else
			player:messageSpecial(FULL_INVENTORY_AFTER_TRADE, 13571);
		end
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

Rivals = player:getQuestStatus(BASTOK,RIVALS);
Fame   = player:getFameLevel(BASTOK);
	
	if (Rivals == QUEST_AVAILABLE and Fame >= 3) then
		player:startEvent(0x005d);
	elseif (Rivals == QUEST_ACCEPTED) then
		player:showText(npc,10311);
	else
		player:startEvent(0x001e);
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

	if (csid == 0x005d) then
		player:addQuest(BASTOK,RIVALS);
	elseif (csid == 0x005e) then
		player:completeQuest(BASTOK,RIVALS);
		player:addFame(BASTOK,BAS_FAME*100);
		player:setTitle(CONTEST_RIGGER);		
		player:addItem(13571);
		player:messageSpecial(ITEM_OBTAINED,13571);
	end
	
end;