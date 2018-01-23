-----------------------------------
-- Area: Windurst Walls
--  NPC: Seven of Diamonds
-- Type: Standard NPC
-- !pos 6.612 -3.5 278.553 239
-----------------------------------
package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if player:hasKeyItem(267) then
        player:startEvent(390);
    else
        player:startEvent(264);
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

