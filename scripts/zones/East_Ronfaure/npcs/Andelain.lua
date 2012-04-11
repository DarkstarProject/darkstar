-----------------------------------
--  Area: East Ronfaure
--   NPC: Andelain
--  Type: Standard NPC
-- @zone: 101
--  @pos: 664.231 -12.849 -539.413
-- 
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/East_Ronfaure/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/East_Ronfaure/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	sermonQuest = player:getQuestStatus(SANDORIA,THE_VICASQUE_S_SERMON);
	
	if(sermonQuest == QUEST_ACCEPTED) then
		count = trade:getItemCount();
		BluePeas = trade:getItemQty(618);
		if (BluePeas == 1 and count == 1 and player:getVar("sermonQuestVar") == 0) then
			player:tradeComplete();
			player:showText(npc, 7331);
			player:startEvent(0x0013);
			player:setVar("sermonQuestVar",1);
		elseif(BluePeas > 1 and count == BluePeas) then
			player:showText(npc, 7334);
			player:startEvent(0x0013);
		elseif(BluePeas == 1 and count == 1) then
			player:showText(npc, 7334,618);
			player:startEvent(0x0013);
		else
			player:showText(npc, 7332);
			player:showText(npc, 7333);
			player:startEvent(0x0013);
		end
	else
		player:showText(npc, 7332);
		player:showText(npc, 7333);
		player:startEvent(0x0013);
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:showText(npc, 7329);
	player:showText(npc, 7330,618);
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
end;

