-----------------------------------
-- Area: Windurst Waters
--  NPC: Tonana
-- Warps players to Windurst Woods
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Waters/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(571);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (option == 1) then
        player:setPos(108.744,-4.999,-134.094,222,241); -- (Retail packet captured)
    end
end;



