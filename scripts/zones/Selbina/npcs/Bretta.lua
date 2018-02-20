-----------------------------------
-- Area: Selbina
--  NPC: Bretta
-- !pos Poor Bretta lost in the depths of the database. Go find her.
-----------------------------------
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Selbina/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getZPos() > -28.750) then
        player:startEvent(1133, 1152 - ((os.time() - 1009810584)%1152));
    else
        player:startEvent(222);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
