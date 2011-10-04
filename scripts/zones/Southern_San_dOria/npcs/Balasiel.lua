-----------------------------------
--	Area: Southern San d'Oria
--	NPC: Balasiel
--  Starts and Finishes: A Squire's Test, A Squire's Test II
-------------------------------------

require("scripts/globals/titles");
require("scripts/globals/keyItems");
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
	currentLevel = player:getMainLvl();
	SquiresTest = player:getQuestStatus(SANDORIA, A_SQUIRE_S_TEST);

	if (currentLevel >= 7 and SquiresTest ~= 2) then
		SquiresTest = player:getQuestStatus(SANDORIA, A_SQUIRE_S_TEST);
		
		if (SquiresTest == 0) then 
			player:startEvent(0x0268);
		elseif (SquiresTest == 1) then
			player:startEvent(0x029d);
		end
		
	elseif (currentLevel >= 15 and SquiresTest == 2) then
		if (player:getQuestStatus(SANDORIA,A_SQUIRE_S_TEST_II) == 0) then
			player:startEvent(0x0271);
		elseif (player:hasKeyItem(STALACTITE_DEW)) then
			player:startEvent(0x029f);
		else
			player:startEvent(0x0273);
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
--printf("RESULT: %u",option);

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
    elseif (csid == 0x0271) then
    	player:addQuest(SANDORIA,A_SQUIRE_S_TEST_II);
	elseif (csid == 0x0272) then
        	player:completeQuest(SANDORIA,A_SQUIRE_S_TEST_II);
			player:addKeyItem(SQUIRE_CERTIFICATE);
			player:messageSpecial(KEYITEM_OBTAINED, SQUIRE_CERTIFICATE);
			player:delKeyItem(STALACTITE_DEW);
			player:setTitle(SPELUNKER);
			player:addFame(SANDORIA, SAN_FAME*20);
			player:tradeComplete();
    end
end;