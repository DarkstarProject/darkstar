-----------------------------------
-- Area: Bastok Markets
-- NPC: Brygid
-- Start & Finishes Quest: Brygid the Stylist
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/zones/Bastok_Markets/TextIDs");
require("scripts/globals/settings");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 


-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

BrygidTheStylist = player:getQuestStatus(BASTOK,BRYGID_THE_STYLIST);
body = player:getEquipID(0x05);
legs = player:getEquipID(0x07);

	if (BrygidTheStylist == QUEST_ACCEPTED and body == 12600 and legs == 12832) then
		player:startEvent(0x0137);
	elseif (BrygidTheStylist ~= QUEST_COMPLETED) then
		player:startEvent(0x0136);
	else
		player:startEvent(0x0077);
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

BrygidTheStylist = player:getQuestStatus(BASTOK,BRYGID_THE_STYLIST);
FreeSlots = player:getFreeSlotsCount();

	if (csid == 0x0136 and BrygidTheStylist == QUEST_AVAILABLE) then
		player:addQuest(BASTOK,BRYGID_THE_STYLIST);
	elseif (csid == 0x0137) then
		if (FreeSlots < 1) then
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12720);
		else
			player:completeQuest(BASTOK,BRYGID_THE_STYLIST);
			player:addItem(12720);
			player:messageSpecial(ITEM_OBTAINED,12720);
			player:addFame(BASTOK,BAS_FAME*120);
			player:setTitle(BRYGIDAPPROVED);
		end
	end
end;