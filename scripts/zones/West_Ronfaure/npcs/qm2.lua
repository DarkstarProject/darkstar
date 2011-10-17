-----------------------------------
-- Area: West Ronfaure
-- NPC: ???
-- NPC for Quest "The Dismayed Customer"
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/globals/quests");
package.loaded["scripts/zones/West_Ronfaure/TextIDs"] = nil;
require("scripts/zones/West_Ronfaure/TextIDs");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	-- "The Dismayed Customer" Quest status
	theDismayedCustomer = player:getQuestStatus(SANDORIA, THE_DISMAYED_CUSTOMER);
	theDismayedCustomerRandom = player:getVar("theDismayedCustomer");
	
	-- "The Dismayed Customer" Quest Dialogs 
	if (theDismayedCustomer == QUEST_ACCEPTED and theDismayedCustomerRandom == 2) then
		player:addKeyItem(129);
		player:messageSpecial(6384, 129);
		player:setVar("theDismayedCustomer", 0);
	else
		player:messageSpecial(7326);
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
	

	
end;



