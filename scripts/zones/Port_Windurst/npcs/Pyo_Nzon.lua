-----------------------------------
-- Area: Port Windurst
--  NPC: Pyo Nzon
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Port_Windurst/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

end;

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
            player:startEvent(539);
        else
            player:startEvent(527);
        end
    elseif (ThePromise == QUEST_ACCEPTED) then
        player:startEvent(517);
    elseif (CryingOverOnions == QUEST_COMPLETED) then
        player:startEvent(510);
    elseif (CryingOverOnions == QUEST_ACCEPTED) then
        player:startEvent(502);
    elseif (OnionRings == QUEST_COMPLETED) then
        player:startEvent(443);
    elseif (OnionRings == QUEST_ACCEPTED ) then
        player:startEvent(437);
    elseif (InspectorsGadget == QUEST_COMPLETED) then
        player:startEvent(426);
    elseif (InspectorsGadget == QUEST_ACCEPTED) then
        player:startEvent(418);
    elseif (KnowOnesOnions == QUEST_COMPLETED) then
        player:startEvent(409);
    elseif (KnowOnesOnions == QUEST_ACCEPTED) then
        KnowOnesOnionsVar  = player:getVar("KnowOnesOnions");

        if (KnowOnesOnionsVar == 2) then
            player:startEvent(408);
        else
            player:startEvent(396);
        end
    elseif (TruthJusticeOnionWay == QUEST_COMPLETED) then
        player:startEvent(382);
    elseif (TruthJusticeOnionWay == QUEST_ACCEPTED) then
        player:startEvent(375);
    else
        player:startEvent(366);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);

end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

end;


