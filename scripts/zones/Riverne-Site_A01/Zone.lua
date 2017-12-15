-----------------------------------
--
-- Zone: Riverne-Site_A01
--
-----------------------------------
package.loaded["scripts/zones/Riverne-Site_A01/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Riverne-Site_A01/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/status");
-----------------------------------

function onInitialize(zone)
    SetServerVariable("Heliodromos_ToD", (os.time() + math.random((43200), (54000))));
    SetServerVariable("[NM]Carmine_Dobsonflies_Killed", 0);
end;

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

function onZoneIn(player,prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(732.55,-32.5,-506.544,90); -- {R}
    end

    return cs;
end;

function afterZoneIn(player)
    if (ENABLE_COP_ZONE_CAP == 1) then -- ZONE WIDE LEVEL RESTRICTION
        player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,40,0,0); -- LV40 cap
    end
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

