-----------------------------------
-- Area: Abyssea - Misareaux
--  NPC: Cavernous Maw
-- !pos 676.070, -16.063, 318.999 216
-- Teleports Players to Valkrum Dunes
-----------------------------------
package.loaded["scripts/zones/Abyssea-Misareaux/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Abyssea-Misareaux/TextIDs");
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
    if (csid == 200 and option ==1) then
        player:setPos(362,0.001,-119,4,103);
    end
end;