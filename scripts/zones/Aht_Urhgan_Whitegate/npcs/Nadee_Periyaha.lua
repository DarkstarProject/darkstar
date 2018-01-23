-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Nadee Periyaha
-- Standard Info NPC
-- !pos -10.802 0.000 -1.198 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local ratRaceProg = player:getVar("ratraceCS");
    if (ratRaceProg == 1) then
       player:startEvent(849);
    elseif (ratRaceProg == 2) then
       player:startEvent(851);
    elseif (ratRaceProg >= 3) then
       player:startEvent(852);
    else
       player:startEvent(90);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 849) then
       player:setVar("ratraceCS",2);
    end
end;

