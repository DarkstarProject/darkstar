-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Miageau
-- Quest NPC
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/settings");
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
	
	-- Trading npc Cheval Water for Wing Pendant
	if (waterOfTheCheval == 1) then
		count = trade:getItemCount();
		freeSlot = player:getFreeSlotsCount();
		chevalWater = trade:hasItemQty(603, 1);
		hasWingPendant = player:hasItem(13183);
		if (count == 1 and freeSlot >= 1 and chevalWater and hasChevalWater == false) then
			player:tradeComplete();
			player:addFame(SANDORIA,SAN_FAME*30);
			player:setTitle(THE_PURE_ONE);
			player:completeQuest(SANDORIA,WATER_OF_THE_CHEVAL );
			player:startEvent(0x0203);
			
		else
			player:messageSpecial(6564, 13183); -- CANNOT_OBTAIN_ITEM, if player already has wing pendant or not enough inv space
		end;
	end;
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	-- "Waters of the Cheval" quest status var
	waterOfTheCheval = player:getQuestStatus(SANDORIA,WATER_OF_THE_CHEVAL);
	
	-- Waters of the Cheval eventId selection
	if (waterOfTheCheval == 0) then
		player:startEvent(0x01f8);
		player:addQuest(SANDORIA, WATER_OF_THE_CHEVAL);
	elseif (waterOfTheCheval == 1) then
		player:startEvent(0x0200);
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

	-- Waters of the Cheval, receiving wing pendant
	if (csid == 0x0203) then
		player:addItem(13183);
		player:messageSpecial(6567, 13183);
	end;
end;



