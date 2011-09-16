-----------------------------------
-- Area: Port San d'Oria
-- NPC: Gulemont
-- NPC for Quest "The Dismayed Customer"
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Port_San_dOria/TextIDs");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
-- "Flyers for Regine" conditional script
FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

	if (FlyerForRegine == 1) then
		count = trade:getItemCount();
		MagicFlyer = trade:hasItemQty(MagicmartFlyer,1);
		if (MagicFlyer == true and count == 1) then
			player:messageSpecial(FLYER_REFUSED);
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	-- "The Dismayed Customer" Quest status
	theDismayedCustomer = player:getQuestStatus(SANDORIA, THE_DISMAYED_CUSTOMER);
	sanFame = player:getFameLevel(SANDORIA);
	
	
	-- "The Dismayed Customer" Quest Dialogs, start
	if (theDismayedCustomer == QUEST_AVAILABLE and sanFame >= 2) then 
		player:startEvent(0x025d);
	elseif (theDismayedCustomer == QUEST_ACCEPTED and player:hasKeyItem(129) == true) then
		player:delKeyItem(129);
		player:addFame(SANDORIA, SAN_FAME*30);
		player:setTitle(LOST_CHILD_OFFICER);
		player:completeQuest(SANDORIA, THE_DISMAYED_CUSTOMER);
		player:startEvent(0x025f);
	elseif (theDismayedCustomer == QUEST_ACCEPTED) then
		player:startEvent(0x025e);
	
	-- Normal NPC TEXT
	else
		player:startEvent(0x0251);
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
	
	-- "The Dismayed Customer"
	if (csid == 0x025d and option == 0) then
		player:addQuest(SANDORIA, THE_DISMAYED_CUSTOMER);
		rand = math.random(1,3);
		player:setVar("theDismayedCustomer", rand);
	elseif (csid == 0x025f) then
		player:addGil(560 * GIL_RATE);
		player:messageSpecial(6404,560 * GIL_RATE);
	end;
	
end;