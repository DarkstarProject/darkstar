-----------------------------------
-- Area: Port Jeuno
--  NPC: Purequane
-- !pos -76 8 54 246
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

    if (player:hasKeyItem(dsp.ki.AIRSHIP_PASS) == true and player:getGil() >= 200) then
        player:startEvent(38);
    else
        player:startEvent(46);
    end

    return 1;

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 38) then
        Z = player:getZPos();

        if (Z >= 58 and Z <= 61) then
            player:delGil(200);
        end
    end

end;