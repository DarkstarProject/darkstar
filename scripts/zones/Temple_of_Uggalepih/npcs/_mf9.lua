-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  Granite Door
-- West Granite Door in Manipulator Room (opens with Prelate Key)
-- @pos -60 -8 -99 159
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Temple_of_Uggalepih/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if(trade:hasItemQty(1137,1) and trade:getItemCount() == 1) then -- Trade Prelate Key
		player:tradeComplete();
		player:messageSpecial(YOUR_KEY_BREAKS,0000,1137);
		GetNPCByID(17428963):openDoor();
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(player:getXPos() > -62) then
		player:messageSpecial(THE_DOOR_IS_LOCKED,1137);
	else
		GetNPCByID(17428963):openDoor();
	end
	
	return 1;
	
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