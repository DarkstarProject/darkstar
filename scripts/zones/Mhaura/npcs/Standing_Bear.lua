-----------------------------------
-- Area: Mhaura
--  NPC: Standing Bear
-----------------------------------
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Mhaura/TextIDs");
-----------------------------------
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(14);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
