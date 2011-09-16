-----------------------------------
-- Area: Lower Jeuno
-- NPC: Ghebi Damomohe
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x6a,4);
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
	if (csid == 0x6a) then
		if option == 0 then
			stock = {0x1135,144,  -- Rice Ball
					 0x1169,2700, -- Eel Kabob 
					 0x1173,3} 	  -- Garlic Cracker

			showShop(player, NORG, stock);
		end
	end
end;