-----------------------------------
--
-- Zone: Mordion_Gaol
--
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/Mordion_Gaol/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Mordion_Gaol/TextIDs");
-----------------------------------

function onInitialize(zone)
end;

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

function onZoneIn(player,prevZone)
    local cs = -1;

    if player:getVar("inJail") > 0 then
        player:jail()
    end

    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

