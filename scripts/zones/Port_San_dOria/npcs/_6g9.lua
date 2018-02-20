-----------------------------------
-- Area: Port San d'Oria
--  NPC: Door: Departures Exit
-- @zone 232
-- !pos -19 -8 27
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Port_San_dOria/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    X = player:getXPos();
    if (X <= -14 and X >= -20) then
        if (player:hasKeyItem(AIRSHIP_PASS) == false) then
            player:startEvent(517);
        elseif (player:getGil() < 200 ) then
            player:startEvent(716);
        else
            player:startEvent(604);
        end
        return 1;
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 604) then
        X = player:getXPos();

        if (X >= -14 and X <= -8) then
            player:delGil(200);
        end
    end

end;

