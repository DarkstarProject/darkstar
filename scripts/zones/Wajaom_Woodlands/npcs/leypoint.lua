-----------------------------------
--  Area:  Wajaom Woodlands
--  NPC:Leypoint
--  Teleport point)
--  @pos -200.027 -8.500 80.058 51
-----------------------------------
 
require("scripts/zones/Wajaom_Woodlands/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
 
-----------------------------------
-- onTrade Action
-----------------------------------
 
function onTrade(player,npc,trade)
 
	if(player:getQuestStatus(AHT_URHGAN,OLDUUM) == QUEST_COMPLETED and player:hasItem(15769) == false) then
		if (trade:hasItemQty(2217,1) and trade:getItemCount() == 1) then -- Trade Lightning Band
			player:tradeComplete(); -- Trade Complete
			player:addItem(15769); -- Receive Olduum Ring
			player:messageSpecial(ITEM_OBTAINED, 15769); -- Message for Receiving Ring
		end
	end
end;
 
-----------------------------------
-- onTrigger Action
-----------------------------------
 
function onTrigger(player,npc)

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
