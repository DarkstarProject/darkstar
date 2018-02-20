-----------------------------------
-- Area: Port Jeuno
--  NPC: Zedduva
-- @zone 246
-- !pos -61 7 -54
-----------------------------------
package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Port_Jeuno/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(AIRSHIP_PASS) == true and player:getGil() >= 200) then
        player:startEvent(36);
    else
        player:startEvent(44);
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

    if (csid == 36) then
        Z = player:getZPos();

        if (Z >= -61 and Z <= -58) then
            player:delGil(200);
        end
    end

end;

