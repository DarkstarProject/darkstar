-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Abeaule
-- NPC for Quest "The Trader in the Forest"
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/globals/settings");
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	-- "Flyers for Regine" conditional script
	FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);
	-- "The Trader in the Forest" Quest status
	theTraderInTheForest = player:getQuestStatus(SANDORIA,THE_TRADER_IN_THE_FOREST);
	
	if (theTraderInTheForest == QUEST_ACCEPTED) then
		count = trade:getItemCount();
		bataGreens = trade:hasItemQty(4367,1);
		freeSlots = player:getFreeSlotsCount();
		print(bataGreens);
		if ( count == 1 and bataGreens == true and freeSlots > 0) then
			player:tradeComplete();
			player:addFame(SANDORIA, SAN_FAME*30);
			player:setTitle(GREEN_GROCER);
			player:completeQuest(SANDORIA, THE_TRADER_IN_THE_FOREST);
			player:startEvent(0x020d);
		else
			player:messageSpecial(6564, 12600);
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

	-- "The Trader in the Forest" Quest status
	theTraderInTheForest = player:getQuestStatus(SANDORIA,THE_TRADER_IN_THE_FOREST);
	
	
	if (theTraderInTheForest == QUEST_AVAILABLE and player:getVar("theTraderInTheForestCS") == 1) then
		player:startEvent(0x0250);
	elseif (theTraderInTheForest == QUEST_AVAILABLE) then
		player:startEvent(0x020c);
		player:setVar("theTraderInTheForestCS",1);
	elseif (theTraderInTheForest == QUEST_ACCEPTED) then
		player:startEvent(0x0251);
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

	-- "The Trader in the Forest" Quest
	if (csid == 0x020c and option == 0) then
		player:addQuest(SANDORIA,THE_TRADER_IN_THE_FOREST);
		if ( player:getFreeSlotsCount() > 0) then
			player:addItem(592);
			player:messageSpecial(6567, 592);
		else
			player:messageSpecial(6564, 592);
		end;
	elseif (csid == 0x0250 and option == 0) then
			player:addQuest(SANDORIA,THE_TRADER_IN_THE_FOREST);
		if ( player:getFreeSlotsCount() > 0) then
			player:addItem(592);
			player:messageSpecial(6567, 592);
		else
			player:messageSpecial(6564, 592);
		end;
	elseif (csid == 0x0251 and option == 1) then
		if (player:getFreeSlotsCount() > 0 and player:hasItem(592) == false) then
			player:addItem(592);
			player:messageSpecial(6567, 592);
		else
			player:messageSpecial(6564, 592);
		end;
	elseif (csid == 0x020d) then
		player:addItem(12600);
		player:messageSpecial(6567, 12600);
	end;
end;



