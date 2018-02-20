-----------------------------------
-- Area: Port Windurst
--  NPC: Honorio
-- @zone 240
-- !pos 218 -5 114
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Port_Windurst/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(AIRSHIP_PASS) == true and player:getGil() >= 200) then
        player:startEvent(181,0,8,0,0,0,0,0,200);
    else
        player:startEvent(183,0,8);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 181) then
        X = player:getXPos();

        if (X >= 222 and X <= 225) then
            player:delGil(200);
        end
    end

end;

