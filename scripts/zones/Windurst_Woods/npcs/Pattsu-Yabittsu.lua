-----------------------------------
-- Area: Windurst Woods
--  NPC: Pattsu-Yabittsu
-- Warps players to Windurst Waters
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Woods/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(411);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (option == 1) then
        player:setPos(-2.203,-1.5,103.226,196,238); -- Retail packet capped
    end
end;



