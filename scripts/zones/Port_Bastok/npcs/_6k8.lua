-----------------------------------
-- Area: Port Bastok
--  NPC: Door: Departures Exit
-- @zone 236
-- !pos -62 1 -8
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Port_Bastok/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(AIRSHIP_PASS) == true and player:getGil() >= 200) then
        player:startEvent(141);
    else
        player:startEvent(142);
    end
    return 1;

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 141) then
        local X = player:getXPos();

        if (X >= -58 and X <= -55) then
            player:delGil(200);
        end
    end

end;

