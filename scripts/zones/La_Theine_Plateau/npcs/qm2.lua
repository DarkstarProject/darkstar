-----------------------------------
--  Area: La Theine Plateau
--  NPC: ??? (qm2)
--  Involved in Quest: HITTING_THE_MARQUISATE (THF AF3)
-----------------------------------
package.loaded["scripts/zones/La_Theine_Plateau/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/zones/La_Theine_Plateau/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
		
	local hittingTheMarquisateNanaaCS = player:getVar("hittingTheMarquisateNanaaCS");	
		
	if (trade:hasItemQty(605,1) and trade:getItemCount() == 1) then -- Trade pickaxe		
		if (hittingTheMarquisateNanaaCS == 1) then
			player:startEvent(0x0077);
		end
	end
end;

-----------------------------------
-- onTrigger
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

	if (csid == 0x0077) then
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,14094);
		else 
		player:addItem(14094);
		player:messageSpecial(ITEM_OBTAINED,14094);	
		player:tradeComplete();
		player:completeQuest(WINDURST, HITTING_THE_MARQUISATE);
		player:addTitle(PARAGON_OF_THIEF_EXCELLENCE);
		player:setVar("hittingTheMarquisateNanaaCS",0);
		player:delKeyItem(CAT_BURGLARS_NOTE);
		end
	end
end;