-----------------------------------
--	Area: Southern San d'Oria
--	NPC: Balasiel
--  Starts and Finishes: A Squire's Test, A Squire's Test II, A Knight's Test
-------------------------------------

require("scripts/globals/titles");
require("scripts/globals/keyItems");
require("scripts/globals/settings");
require("scripts/globals/quests");
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	count = trade:getItemCount();
	gil = trade:getGil();

	if (trade:hasItemQty(REVIVAL_TREE_ROOT,1) == true and gil == 0 and count == 1 and player:getQuestStatus(SANDORIA,A_SQUIRE_S_TEST) == 1) then
		player:startEvent(0x0269);
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	currentLevel = player:getMainLvl();

	if (currentLevel < 7) then
		player:startEvent(0x029c);
	elseif (currentLevel >= 7 and player:getQuestStatus(SANDORIA, A_SQUIRE_S_TEST) ~= 2) then
		if (player:getQuestStatus(SANDORIA, A_SQUIRE_S_TEST) == 0) then
			if (player:getRace() == 3) then
				player:startEvent(0x0268);
			else
				player:startEvent(0x0277);
			end
		elseif (player:getQuestStatus(SANDORIA, A_SQUIRE_S_TEST) == 1) then
			player:startEvent(0x029b);
		end
	elseif (currentLevel >= 7 and currentLevel < 15) then
		player:startEvent(0x029f);
	elseif (currentLevel >= 15 and player:getQuestStatus(SANDORIA,A_SQUIRE_S_TEST_II) ~= 2) then
		if (player:getQuestStatus(SANDORIA,A_SQUIRE_S_TEST_II) == 0) then
			if (player:getRace() == 3) then
				player:startEvent(0x0271);
			else
				player:startEvent(0x0276);
			end
		elseif (player:hasKeyItem(STALACTITE_DEW)) then
			player:startEvent(0x0272);
		else
			player:startEvent(0x029b);
		end
	elseif (currentLevel >= 15 and currentLevel < 30) then
		player:startEvent(0x029e);
	elseif (currentLevel >= 30 and player:getQuestStatus(SANDORIA, A_KNIGHT_S_TEST) ~= 2) then
		if (player:getQuestStatus(SANDORIA,A_KNIGHT_S_TEST) == 0) then
			if (player:getRace() == 3) then
				player:startEvent(0x0273);
			else
				player:startEvent(0x027b);
			end
		elseif (player:hasKeyItem(KNIGHTS_SOUL)) then
			player:startEvent(0x0274);
		else
			player:startEvent(0x029d);
		end
	else
		player:startEvent(0x029b);
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
			player:addItem(SPATHA);
			player:messageSpecial(ITEM_OBTAINED, SPATHA);
			player:setTitle(KNIGHT_IN_TRAINING);
			player:addFame(SANDORIA, SAN_FAME*20);
			player:tradeComplete();
        else
           player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, SPATHA);
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
	elseif (csid == 0x0273 and option == 0) then
		player:addQuest(SANDORIA,A_KNIGHT_S_TEST);
		player:addKeyItem(BOOK_OF_TASKS);
		player:messageSpecial(KEYITEM_OBTAINED, BOOK_OF_TASKS);
	elseif (csid == 0x0274) then
		if (player:getFreeSlotsCount(0) >= 1) then
			player:completeQuest(SANDORIA,A_KNIGHT_S_TEST);
			player:addItem(KITE_SHIELD);
			player:messageSpecial(ITEM_OBTAINED, KITE_SHIELD);
			player:setTitle(TRIED_AND_TESTED_KNIGHT);
			player:addFame(SANDORIA, SAN_FAME*20);
			player:delKeyItem(KNIGHTS_SOUL);
			player:delKeyItem(BOOK_OF_TASKS);
			player:delKeyItem(BOOK_OF_THE_WEST);
			player:delKeyItem(BOOK_OF_THE_EAST);
			player:unlockJob(7); --Paladin
			player:messageSpecial(UNLOCK_PALADIN);
		else
           player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, KITE_SHIELD);
	    end
	end
end;
