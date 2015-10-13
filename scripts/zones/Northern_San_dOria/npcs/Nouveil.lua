-----------------------------------
--  Area: Northern San d'Oria
--   NPC: Nouveil
--  Type: General
-- @zone: 231
--  @pos 123 0 106
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
		
	if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
		if (trade:hasItemQty(532,1) == true and trade:getItemCount() == 1) then
			player:messageSpecial(FLYER_REFUSED);
		end
	end
	
	if (player:getQuestStatus(SANDORIA,WATER_OF_THE_CHEVAL) == QUEST_ACCEPTED) then
		if (trade:getGil() >= 10) then
			player:startEvent(0x023b);
		end;
	end;
		
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if (player:getQuestStatus(SANDORIA,WATER_OF_THE_CHEVAL) == QUEST_ACCEPTED) then
		if (player:hasItem(603) == true) then
			player:startEvent(0x023d);
		elseif (player:hasItem(602) == true) then
			player:startEvent(0x023c);
		else
			player:startEvent(0x023f);
		end;
	else
		player:startEvent(0x023e);
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
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 602);
		else
			player:delGil(10);
			player:addItem(602);
			player:messageSpecial(ITEM_OBTAINED, 602);
		end;
	end;
end;




