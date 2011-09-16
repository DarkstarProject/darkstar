-----------------------------------
-- Area: East Ronfaure
-- NPC: Cheval_River
-- Quest NPC
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	-- "Waters of the Cheval" quest status var
	waterOfTheCheval = player:getQuestStatus(SANDORIA,WATER_OF_THE_CHEVAL);	
	
	-- Waters of the Cheval, trading Blessed waterskin for Cheval Water
	if (waterOfTheCheval == 1) then
		count = trade:getItemCount();
		freeSlot = player:getFreeSlotsCount();
		blessedWaterskin = trade:hasItemQty(602, 1);
		hasChevalWater = player:hasItem(603); 
		if (count == 1 and blessedWaterskin and freeSlot >= 1 and hasChevalWater == false) then
			player:tradeComplete();
			player:addItem(603);
			player:messageSpecial(6381, 603); -- OBTAINED_ITEM, cheval water
		else
			player:messageSpecial(6378, 603); -- CANNOT_OBTAIN_ITEM, because inv full or already has cheval water
		end;
	end;
			
		
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
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

end;