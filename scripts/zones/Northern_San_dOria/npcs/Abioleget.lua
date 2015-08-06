-----------------------------------
--  Area: Northern San d'Oria
--  NPC: Abioleget
--  Type: Quest Giver (Her Memories: The Faux Pas and The Vicasque's Sermon) / Merchant
--  @zone: 231
--  @pos 128.771 0.000 118.538
--
-----------------------------------

package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Northern_San_dOria/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/quests");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if (sermonQuest == QUEST_ACCEPTED) then
		gil = trade:getGil();
		count = trade:getItemCount();
		if (gil == 70 and count == 1) then
			player:tradeComplete();
			player:startEvent(0x024F);
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	sermonQuest = player:getQuestStatus(SANDORIA,THE_VICASQUE_S_SERMON);
	
	if (sermonQuest == QUEST_AVAILABLE) then
		player:startEvent(0x024d);
	elseif (sermonQuest == QUEST_ACCEPTED) then
		if (player:getVar("sermonQuestVar") == 1) then
			player:tradeComplete();
			player:startEvent(0x0258);
		else
			player:showText(npc,11103,618,70);
		end
	else
		player:showText(npc,ABIOLEGET_DIALOG);
	end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
	
	if (csid == 0x0258) then
		player:addItem(13465);
		player:messageSpecial(6567, 13465);
		player:addFame(SANDORIA,SAN_FAME*30);
		player:addTitle(THE_BENEVOLENT_ONE);
		player:setVar("sermonQuestVar",0);
		player:completeQuest(SANDORIA,THE_VICASQUE_S_SERMON );
	elseif (csid == 0x024D) then	
		player:addQuest(SANDORIA,THE_VICASQUE_S_SERMON );
	elseif (csid == 0x024F) then	
		player:addItem(618);
		player:messageSpecial(6567, 618);
	end
end;

