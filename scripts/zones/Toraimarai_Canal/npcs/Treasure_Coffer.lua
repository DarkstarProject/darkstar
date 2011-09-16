-----------------------------------
-- Area: Windurst Walls
-- NPC: Treasure Coffer
-- Involved In Quest: Wild Card
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Toraimarai_Canal/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

count = trade:getItemCount();
CanalCofferKey = trade:hasItemQty(1057,1);

	if (CanalCofferKey == true and count == 1) then
		WildCardVar = player:getVar("WildCard");
		
		if (WildCardVar == 2) then
			player:tradeComplete();
			player:addKeyItem(264);
			player:messageSpecial(KEYITEM_OBTAINED,264);
			player:setVar("WildCard",3);
		end
	end	
   
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	player:messageSpecial(CHEST_IS_LOCKED,1057);
   
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);

end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

end;