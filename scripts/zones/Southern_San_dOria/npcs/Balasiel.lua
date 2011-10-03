-----------------------------------
--	Area: Southern San d'Oria
--	NPC: Ephauge
--  General Info NPC
-------------------------------------

require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade)
	count = trade:getItemCount();
	gil = trade:getGil();
	RevivalTreeRoot = trade:hasItemQty(940,1);
	
	if (RevivalTreeRoot == true and gil == 0 and count == 1 and player:getQuestStatus(SANDORIA,A_SQUIRE_S_TEST) == 1) then
		player:startEvent(0x0269);
	end
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc)

	if (player:getMainLvl() >= 7) then
		if (player:getQuestStatus(SANDORIA,A_SQUIRE_S_TEST) == 0) then 
			player:startEvent(0x0268);
		end
	else
		player:startEvent(0x029c);
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
printf("RESULT: %u",option);

	if (csid == 0x0268 and option == 0) then
		player:addQuest(SANDORIA,A_SQUIRE_S_TEST);
	elseif (csid == 0x0269) then
        if (player:getFreeSlotsCount(0) >= 1) then
        	player:completeQuest(SANDORIA,A_SQUIRE_S_TEST);
			player:addItem(16565) -- Spatha
			player:messageSpecial(ITEM_OBTAINED, 16565);
			player:setTitle(KNIGHT_IN_TRAINING);
			player:addFame(SANDORIA, SAN_FAME*20);
			player:tradeComplete();
        else
           player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 16565);
        end
    end
end;