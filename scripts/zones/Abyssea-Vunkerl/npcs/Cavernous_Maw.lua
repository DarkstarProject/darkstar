-----------------------------------
-- Area: Abyssea - Vunkerl
--  NPC: Cavernous Maw
-- !pos -360.000 -46.750 700.000 217
-- Notes: Teleports Players to Jugner Forest
-----------------------------------
package.loaded["scripts/zones/Abyssea-Vunkerl/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Abyssea-Vunkerl/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(200);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 200 and option == 1) then
        player:setPos(241,0.001,11,42,104);
    end
end;