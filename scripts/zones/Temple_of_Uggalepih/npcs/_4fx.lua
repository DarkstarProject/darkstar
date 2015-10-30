-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  Granite Door
-- @pos 340 0.1 329 159
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/globals/keyitems");
require("scripts/zones/Temple_of_Uggalepih/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if (trade:hasItemQty(1143,1) and trade:getItemCount() == 1 and player:getZPos() < 332) then -- Trade cursed key
		if (player:getCurrentMission(WINDURST) == AWAKENING_OF_THE_GODS and player:getVar("MissionStatus") == 4) then
			player:tradeComplete();
			player:startEvent(0x0017);
			
		else
			player:tradeComplete();
			player:messageSpecial(YOUR_KEY_BREAKS,0,1143);
			player:startEvent(0x0019);
		end
	else
		player:messageSpecial(NOTHING_HAPPENS);
	end	
end;
-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
print("hi");
	if (player:getZPos() < 332) then
		player:messageSpecial(DOOR_LOCKED);
	else
		player:startEvent(0x001a);
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
	
	if (csid == 0x0017) then
		player:setPos(340,0,333);
		player:delKeyItem(BLANK_BOOK_OF_THE_GODS);
		player:addKeyItem(BOOK_OF_THE_GODS);
		player:messageSpecial(KEYITEM_OBTAINED,BOOK_OF_THE_GODS);
		player:setVar("MissionStatus",5);
	end
	
end;
