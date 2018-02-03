-----------------------------------
-- Area: Port Windurst
--  NPC: Gomada-Vulmada
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
            player:startEvent(528);
        else
            player:startEvent(540);
        end
    elseif (ThePromise == QUEST_ACCEPTED) then
        player:startEvent(518);
    elseif (CryingOverOnions == QUEST_COMPLETED) then
        player:startEvent(507);
    elseif (CryingOverOnions == QUEST_ACCEPTED) then
        player:startEvent(500);
    elseif (OnionRings == QUEST_COMPLETED) then
        player:startEvent(442);
    elseif (OnionRings == QUEST_ACCEPTED ) then
        player:startEvent(435);
    elseif (InspectorsGadget == QUEST_COMPLETED) then
        player:startEvent(425);
    elseif (InspectorsGadget == QUEST_ACCEPTED) then
        player:startEvent(417);
    elseif (KnowOnesOnions == QUEST_COMPLETED) then
        player:startEvent(405);
    elseif (KnowOnesOnions == QUEST_ACCEPTED) then
        KnowOnesOnionsVar  = player:getVar("KnowOnesOnions");

        if (KnowOnesOnionsVar == 2) then
            player:startEvent(404);
        else
            player:startEvent(394);
        end
    elseif (TruthJusticeOnionWay == QUEST_COMPLETED) then
        player:startEvent(381);
    elseif (TruthJusticeOnionWay == QUEST_ACCEPTED) then
        player:startEvent(373);
    else
        player:startEvent(363);
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


