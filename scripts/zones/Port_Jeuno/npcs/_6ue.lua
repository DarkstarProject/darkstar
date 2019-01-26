-----------------------------------
-- Area: Port Jeuno
--  NPC: Door: Departures Exit (for Windurst)
-- !pos 3 7 -54 246
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(dsp.ki.AIRSHIP_PASS) == true and player:getGil() >= 200) then
        player:startEvent(39);
    else
        player:startEvent(47);
    end

    return 1;

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 39) then
        Z = player:getZPos();

        if (Z >= -61 and Z <= -58) then
            player:delGil(200);
        end
    end

end;