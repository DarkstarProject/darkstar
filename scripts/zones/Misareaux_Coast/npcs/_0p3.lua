-----------------------------------
-- Area:  Misareaux Coast
--  NPC: Dilapidated Gate
--  Notes: Entrance to Misareaux Coast
-----------------------------------
package.loaded["scripts/zones/Misareaux_Coast/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
require("scripts/zones/Misareaux_Coast/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(553);
    return 1;
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);


end;