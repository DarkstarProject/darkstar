-----------------------------------
-- Area: Outer Ra'Kaznar
--  NPC: Liseran Door Exit
-- Zones out to Kamihr Drifts (zone 267)
-- @zone 274
-- !pos -34.549 -181.334 -20.031
-----------------------------------
package.loaded["scripts/zones/Outer_RaKaznar/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Outer_RaKaznar/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(28);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 28 and option == 1) then
        player:setPos(-279.709,19.976,60.353,0,267);
    end
end;