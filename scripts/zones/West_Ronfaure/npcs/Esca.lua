-----------------------------------
-- Area: Port San d'Oria
-- NPC: Esca
-- NPC for Quest "The Pickpocket"
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
require("scripts/zones/Port_San_dOria/TextIDs");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	-- "The Pickpocket" Quest status
	thePickpocket = player:getQuestStatus(SANDORIA, THE_PICKPOCKET);
	
	-- "The Pickpocket" Trading Esca for Gilt Glasses
	count = trade:getItemCount();
	freeSlot = player:getFreeSlotsCount();
	eagleButton = trade:hasItemQty(578, 1);
	hasGiltGlasses = player:hasItem(579);
	if (count == 1 and freeSlot > 0 and eagleButton == true and hasGiltGlasses == false) then
		player:tradeComplete();
		player:startEvent(0x0079);
		player:setVar("thePickpocketGiltGlasses", 1); -- used to get eventID 0x0080
	else
		player:messageSpecial(6378, 579); -- CANNOT_OBTAIN_ITEM
	end;
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	-- "The Pickpocket" Quest status
	thePickpocket = player:getQuestStatus(SANDORIA, THE_PICKPOCKET);
	
	-- "The Pickpocket" Quest Dialog
	if (thePickpocket == 1 and player:getVar("thePickpocketGiltGlasses") == 1)  then
		player:startEvent(0x0080);
	elseif (thePickpocket == 1) then
		player:startEvent(0x0078);
	elseif (thePickpocket == 2) then
		player:startEvent(0x007b);
	else
		player:startEvent(0x0077);
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

	-- "The Pickpocket" recieving Gilt Glasses
	if (csid == 0x0079) then
		player:addItem(579);
		player:messageSpecial(6381, 579);
	end;
end;




