-----------------------------------
-- Area: Port Windurst
-- NPC: Papo-Hopo
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
            player:startEvent(0x0219);
        else
            player:startEvent(0x020d);
        end
    elseif (ThePromise == QUEST_ACCEPTED) then
        player:startEvent(0x0203);
    elseif (CryingOverOnions == QUEST_COMPLETED) then
        player:startEvent(0x01fd);
    elseif (CryingOverOnions == QUEST_ACCEPTED) then
        CryingOverOnionsVar = player:getVar("CryingOverOnions");
        
        if (CryingOverOnionsVar >= 1) then
            player:startEvent(0x01fc);
        else
            player:startEvent(0x01f5);
        end
    elseif (OnionRings == QUEST_COMPLETED) then
        player:startEvent(0x01b9);
    elseif (OnionRings == QUEST_ACCEPTED ) then
        player:startEvent(0x01b2);
    elseif (InspectorsGadget == QUEST_COMPLETED) then
        player:startEvent(0x01a8);
    elseif (InspectorsGadget == QUEST_ACCEPTED) then
        player:startEvent(0x01a0);
    elseif (KnowOnesOnions == QUEST_COMPLETED) then
        player:startEvent(0x0193);
    elseif (KnowOnesOnions == QUEST_ACCEPTED) then
        KnowOnesOnionsVar  = player:getVar("KnowOnesOnions");
        
        if (KnowOnesOnionsVar == 2) then
            player:startEvent(0x0192);
        else
            player:startEvent(0x0189);
        end
    elseif (TruthJusticeOnionWay == QUEST_COMPLETED) then
        player:startEvent(0x017c);
    elseif (TruthJusticeOnionWay == QUEST_ACCEPTED) then
        player:startEvent(0x0174);
    else
        player:startEvent(0x016a);
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




