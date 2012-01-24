-----------------------------------
-- Area: King Ranperre's Tomb
-- NPC:  Tombstone
-- Involved in Quest: Grave Concerns
-- @zone 190
-- @pos 
-----------------------------------
package.loaded["scripts/zones/King_Ranperres_Tomb/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/King_Ranperres_Tomb/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if(player:getQuestStatus(SANDORIA,GRAVE_CONCERNS) == QUEST_ACCEPTED) then
		if(trade:hasItemQty(SOWellWater,1) and trade:getItemCount() == 1) then
			player:startEvent(0x0003);
			player:tradeComplete();
			player:setVar("OfferingWaterOK",1);
		end
	end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc) 
	
	if(player:hasItem(TGWaterskin) == false and player:hasItem(SOWellWater) == false) then
		player:startEvent(0x0002);
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

	if(csid == 0x0002) then
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,TGWaterskin);
		else
			player:addItem(TGWaterskin);
			player:messageSpecial(ITEM_OBTAINED,TGWaterskin);
		end
	end
	
end;
