-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Nouveil
-- Quest NPC
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	-- "Flyers for Regine" conditional script
	FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);
	-- "Waters of the Cheval" quest status var
	waterOfTheCheval = player:getQuestStatus(SANDORIA,WATER_OF_THE_CHEVAL);
	
	if (FlyerForRegine == 1) then
		count = trade:getItemCount();
		MagicFlyer = trade:hasItemQty(MagicmartFlyer,1);
		if (MagicFlyer == true and count == 1) then
			player:messageSpecial(FLYER_REFUSED);
		end
	end
	
	-- Waters of the Cheval, trade 10 gil for blessed waterskin
	if (waterOfTheCheval == 1) then
		gil = trade:getGil();
		freeSlot = player:getFreeSlotsCount();
		hasWaterskin = player:hasItem(602);
		if (gil == 10 and freeSlot >= 1 and hasWaterskin == false) then
			player:tradeComplete();
			player:startEvent(0x023b);
		else
			player:messageSpecial(6564, 602); -- CANNOT_OBTAIN_ITEM, inv full or already has item
		end;
	end;
			
		
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	-- "Waters of the Cheval" quest status var
	waterOfTheCheval = player:getQuestStatus(SANDORIA,WATER_OF_THE_CHEVAL);
	
	-- Waters of the Cheval event selection
	if (waterOfTheCheval == 1) then
		player:startEvent(0x023f);
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

	-- Waters of the Cheval, recieve blessed waterskin
	if (csid == 0x023b) then
		player:addItem(602);
		player:messageSpecial(6567, 602);
	end;
end;




