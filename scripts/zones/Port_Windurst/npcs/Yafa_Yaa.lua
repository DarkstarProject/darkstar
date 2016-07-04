-----------------------------------
-- Area: Port Windurst
-- NPC: Yafa Yaa
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
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
            player:startEvent(0x021a);
        else
            player:startEvent(0x020e);
        end
    elseif (ThePromise == QUEST_ACCEPTED) then
        player:startEvent(0x0204);
    elseif (CryingOverOnions == QUEST_COMPLETED) then
        player:startEvent(0x01fa);
    elseif (CryingOverOnions == QUEST_ACCEPTED) then
        player:startEvent(0x01f3);
    elseif (OnionRings == QUEST_COMPLETED) then
        player:startEvent(0x01bc);
    elseif (OnionRings == QUEST_ACCEPTED ) then
        player:startEvent(0x01b4);
    elseif (InspectorsGadget == QUEST_COMPLETED) then
        player:startEvent(0x01ab);
    elseif (InspectorsGadget == QUEST_ACCEPTED) then
        player:startEvent(0x01a3);
    elseif (KnowOnesOnions == QUEST_COMPLETED) then
        player:startEvent(0x0197);
    elseif (KnowOnesOnions == QUEST_ACCEPTED) then
        KnowOnesOnionsVar  = player:getVar("KnowOnesOnions");
        
        if (KnowOnesOnionsVar == 2) then
            player:startEvent(0x0196);
        else
            player:startEvent(0x018d);
        end
    elseif (TruthJusticeOnionWay == QUEST_COMPLETED) then
        player:startEvent(0x017f);
    elseif (TruthJusticeOnionWay == QUEST_ACCEPTED) then
        player:startEvent(0x0178);
    else
        player:startEvent(0x016d);
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




