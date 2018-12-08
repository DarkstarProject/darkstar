-----------------------------------
-- Area: Sealion's Den
--  NPC: Sueleen
-- !pos 612 132 774 32
-----------------------------------
require("scripts/globals/teleports");
require("scripts/globals/missions");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getCurrentMission(COP) > THE_WARRIOR_S_PATH) then
        player:startEvent(12);
    elseif (player:getCurrentMission(COP) == FLAMES_IN_THE_DARKNESS and player:getVar("PromathiaStatus") == 1) then
        player:startEvent(16);
    elseif (player:getCurrentMission(COP) == CALM_BEFORE_THE_STORM and player:hasKeyItem(dsp.ki.LETTERS_FROM_ULMIA_AND_PRISHE)) then
        player:startEvent(17);
    else
        player:startEvent(20);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("onUpdate CSID: %u",csid);
    -- printf("onUpdate RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("onFinish CSID: %u",csid);
    -- printf("onFinish RESULT: %u",option);

    if (csid == 12 and option == 1) then
        dsp.teleport.to(player, dsp.teleport.id.SEA);
    elseif (csid == 16) then
        player:setVar("PromathiaStatus",2);
    elseif (csid == 17) then
        player:completeMission(COP,CALM_BEFORE_THE_STORM);
        player:addMission(COP,THE_WARRIOR_S_PATH);
        player:setVar("PromathiaStatus",0);
        player:setVar("COP_Dalham_KILL",0);
        player:setVar("COP_Boggelmann_KILL",0);
        player:setVar("Cryptonberry_Executor_KILL",0);
    end
end;
