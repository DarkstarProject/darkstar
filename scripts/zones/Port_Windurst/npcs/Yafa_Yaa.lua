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
            player:startEvent(538);
        else
            player:startEvent(526);
        end
    elseif (ThePromise == QUEST_ACCEPTED) then
        player:startEvent(516);
    elseif (CryingOverOnions == QUEST_COMPLETED) then
        player:startEvent(506);
    elseif (CryingOverOnions == QUEST_ACCEPTED) then
        player:startEvent(499);
    elseif (OnionRings == QUEST_COMPLETED) then
        player:startEvent(444);
    elseif (OnionRings == QUEST_ACCEPTED ) then
        player:startEvent(436);
    elseif (InspectorsGadget == QUEST_COMPLETED) then
        player:startEvent(427);
    elseif (InspectorsGadget == QUEST_ACCEPTED) then
        player:startEvent(419);
    elseif (KnowOnesOnions == QUEST_COMPLETED) then
        player:startEvent(407);
    elseif (KnowOnesOnions == QUEST_ACCEPTED) then
        KnowOnesOnionsVar  = player:getVar("KnowOnesOnions");
        
        if (KnowOnesOnionsVar == 2) then
            player:startEvent(406);
        else
            player:startEvent(397);
        end
    elseif (TruthJusticeOnionWay == QUEST_COMPLETED) then
        player:startEvent(383);
    elseif (TruthJusticeOnionWay == QUEST_ACCEPTED) then
        player:startEvent(376);
    else
        player:startEvent(365);
    end
   
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);

end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

end;


