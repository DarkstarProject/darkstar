-----------------------------------
-- Area: Rabao
-- NPC: Irmilant
-- Starts and Ends Quests: The Immortal Lu Shang and Indomitable Spirit
-----------------------------------
package.loaded["scripts/zones/Rabao/TextIDs"] = nil;

require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Rabao/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	ImmortalLuShang = player:getQuestStatus(OUTLANDS,THE_IMMORTAL_LU_SHANG);
	
	if((ImmortalLuShang == QUEST_AVAILABLE or ImmortalLuShang == QUEST_COMPLETED) and trade:hasItemQty(720,1) and trade:hasItemQty(489,1) and trade:hasItemQty(4102,2) and trade:getItemCount() == 4) then
		player:startEvent(0x004e); 
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	ImmortalLuShang = player:getQuestStatus(OUTLANDS,THE_IMMORTAL_LU_SHANG);

	if(player:hasItem(489) == true and (ImmortalLuShang == QUEST_AVAILABLE or ImmortalLuShang == QUEST_COMPLETED)) then
		player:startEvent(0x004d); --Offer the quest if the player has the broken rod
	else
		player:startEvent(0x004C);
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
	if(csid == 0x004e) then
		player:tradeComplete();
		player:setTitle(265);
		player:addItem(17386); -- Lu Shang's Fishing Rod
		player:messageSpecial(ITEM_OBTAINED, 17386); 
		player:completeQuest(OUTLANDS,THE_IMMORTAL_LU_SHANG);
		player:addFame(OUTLANDS,60);  
	end
end;



