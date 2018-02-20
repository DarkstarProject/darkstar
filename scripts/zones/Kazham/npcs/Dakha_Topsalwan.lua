-----------------------------------
-- Area: Kazham
--  NPC: Dakha Topsalwan
-- @zone 250
-- !pos
-----------------------------------
package.loaded["scripts/zones/Kazham/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Kazham/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    Z = player:getZPos();

    if (Z >= -20 and Z <= -16) then
        player:startEvent(66);
    else
        player:startEvent(121);
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

