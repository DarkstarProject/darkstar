-----------------------------------
--	Area: Windurst Woods
--	NPC: Jack of Spades
--	Adventurer's Assistant
--	Working 100%
-------------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
require("scripts/zones/Windurst_Woods/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade)

count = trade:getItemCount();
AdventurerCoupon = trade:hasItemQty(536,1);

	if (AdventurerCoupon == true and count == 1) then
		player:startEvent(0x271a,GIL_RATE*50);
	end
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 
	player:startEvent(0x2719,0,4);
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
	if (csid == 0x271a) then
		player:tradeComplete();
		player:addGil(GIL_RATE*50);
		player:addKeyItem(8);
		player:addKeyItem(9);
		player:addKeyItem(138);
		player:messageSpecial(KEYITEM_OBTAINED,8);
		player:messageSpecial(KEYITEM_OBTAINED,9);
		player:messageSpecial(KEYITEM_OBTAINED,138);
	end
end;



