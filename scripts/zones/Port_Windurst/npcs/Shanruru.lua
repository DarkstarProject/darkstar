-----------------------------------
-- Area: Port Windurst
-- NPC: Shanruru
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Port_Windurst/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
   
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

TruthJusticeOnionWay = player:getQuestStatus(WINDURST,TRUTH_JUSTICE_AND_THE_ONION_WAY);
KnowOnesOnions       = player:getQuestStatus(WINDURST,KNOW_ONE_S_ONIONS);
InspectorsGadget     = player:getQuestStatus(WINDURST,INSPECTOR_S_GADGET);
OnionRings           = player:getQuestStatus(WINDURST,ONION_RINGS);
CryingOverOnions     = player:getQuestStatus(WINDURST,CRYING_OVER_ONIONS);
ThePromise = player:getQuestStatus(WINDURST,THE_PROMISE);

	if (ThePromise == QUEST_COMPLETED) then
		Message = math.random(0,1)
		
		if (Message == 1) then
			player:startEvent(0x0211);
		else
			player:startEvent(0x021d);
		end
	elseif (CryingOverOnions == QUEST_ACCEPTED) then
		player:startEvent(0x01f8);
	elseif (OnionRings == QUEST_COMPLETED) then
		player:startEvent(0x01be);
	elseif (OnionRings == QUEST_ACCEPTED ) then
		player:startEvent(0x01b7);
	elseif (InspectorsGadget == QUEST_COMPLETED) then
		player:startEvent(0x01ac);
	elseif (InspectorsGadget == QUEST_ACCEPTED) then
		player:startEvent(0x01a4);
	elseif (KnowOnesOnions == QUEST_COMPLETED) then
		player:startEvent(0x019c);
	elseif (TruthJusticeOnionWay == QUEST_COMPLETED) then
		player:startEvent(0x0180);
	elseif (TruthJusticeOnionWay == QUEST_ACCEPTED) then
		player:startEvent(0x0179);
	else
		player:startEvent(0x016f);
	end
   
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