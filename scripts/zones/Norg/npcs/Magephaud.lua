-----------------------------------
-- Area: Norg
-- NPC: Magephaud
-- Standard Info NPC
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	EveryonesGrudge = player:getQuestStatus(OUTLANDS,EVERYONES_GRUDGE);
	if (EveryonesGrudge == QUEST_ACCEPTED) then
		if (trade:hasItemQty(748,3) and trade:getItemCount() == 3) then
			player:startEvent(0x0076,748);
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	nFame = player:getFameLevel(NORG);
	if (player:getQuestStatus(OUTLANDS,EVERYONES_GRUDGE) == QUEST_AVAILABLE and player:getVar("EVERYONES_GRUDGE_KILLS") >= 1 and nFame >= 2) then
		player:startEvent(0x0074,748);  -- Quest start - you have tonberry kills?! I got yo back ^.-
	elseif (player:getVar("EveryonesGrudgeStarted")  == 1) then
		player:startEvent(0x0075,748);
	elseif (player:getQuestStatus(OUTLANDS,EVERYONES_GRUDGE) == QUEST_COMPLETED) then
		player:startEvent(0x0077);  -- After completion cs
	else
		player:startEvent(0x0073);
	end
	printf("CSID: %u",nFame);
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
	if (csid == 0x0074) then
		player:addQuest(OUTLANDS,EVERYONES_GRUDGE);
		player:setVar("EveryonesGrudgeStarted",1);
	elseif (csid == 0x0076) then
		player:completeQuest(OUTLANDS,EVERYONES_GRUDGE);
		player:tradeComplete();
		player:addFame(OUTLANDS,NORG_FAME*80);
		player:addKeyItem(291);    -- Permanent Tonberry key
		player:messageSpecial(KEYITEM_OBTAINED,291);
		player:setVar("EveryonesGrudgeStarted",0);
		player:addTitle(HONORARY_DOCTORATE_MAJORING_IN_TONBERRIES);
	end
end;



