-----------------------------------
--  Area: Southern San d'Oria
--  NPC: Helbort
--  Starts and Finished Quest: A purchase of Arms
--  @zone 230
--  @pos  71 -1 65
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	quest_fas = player:getQuestStatus(FATHER_AND_SON);  -- 1st Quest in Series
	quest_poa = player:getQuestStatus(A_PURCHASE_OF_ARMS);  -- 2nd Quest in Series

	if(player:getFameLevel(SANDORIA) >= 2 and quest_fas == QUEST_COMPLETED and quest_poa == QUEST_AVAILABLE) then  
        player:startEvent(0x0252);  -- Start quest A Purchase of Arms
	elseif(quest_poa == QUEST_ACCEPTED and player:hasKeyItem(WEAPONS_RECEIPT) == true) then
        player:startEvent(0x025f); -- Finish A Purchase of Arms quest
	else
		player:startEvent(0x0251);  -- Standard Dialog
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
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option); 

	if(csid == 0x0252 and option == 0) then
		player:addQuest(SANDORIA, A_PURCHASE_OF_ARMS);
		player:addKeyItem(WEAPONS_ORDER);
		player:messageSpecial(KEYITEM_OBTAINED,WEAPONS_ORDER);
	elseif(csid == 0x025f) then
		if (player:getFreeSlotsCount(0) == 0) then
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17090);
		else
			player:completeQuest(SANDORIA, A_PURCHASE_OF_ARMS);
			player:delKeyItem(WEAPONS_RECEIPT); --delete KI
			player:addFame(SANDORIA,30); --fame
			player:setTitle(ARMS_TRADER); --title : Arms Trader
			player:addItem(17090); --reward : Elm Staff
			player:messageSpecial(ITEM_OBTAINED,17090);
		end
	end 
end;