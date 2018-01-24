-----------------------------------
--
-- Zone: Misareaux_Coast (25)
--
-----------------------------------
package.loaded["scripts/zones/Misareaux_Coast/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Misareaux_Coast/TextIDs");
require("scripts/zones/Misareaux_Coast/MobIDs");
require("scripts/globals/settings");

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
    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
        player:setPos(567.624,-20,280.775,120);
    end
    return cs;
end;

function onRegionEnter(player,region)
end;

function onGameHour(zone)
    local baited = GetServerVariable("[Ziphius]Bait Trap");

    if (VanadielHour() == 22) then  -- Spawn traps for Ziphius
        for i = ZIPHIUS_QM_BASE, ZIPHIUS_QM_BASE+5, 1 do
            GetNPCByID(i):setStatus(STATUS_NORMAL);
        end
    elseif (VanadielHour() == 7) then  -- Despawn traps for Ziphius
        for i = ZIPHIUS_QM_BASE, ZIPHIUS_QM_BASE+5, 1 do
            GetNPCByID(i):setStatus(STATUS_DISAPPEAR);
        end
        SetServerVariable("[Ziphius]Bait Trap", 0);
    elseif (VanadielHour() == 4) then  -- Despawn non-baited traps
        for i = ZIPHIUS_QM_BASE, ZIPHIUS_QM_BASE+5, 1 do
            if (bit.band(baited, bit.lshift(1, (i - ZIPHIUS_QM_BASE))) == 0) then
                GetNPCByID(i):setStatus(STATUS_DISAPPEAR);
            end
        end
    end
end;
function onEventUpdate(player,csid,option)
    --printf("CSID: %u",csid);
    --printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    --printf("CSID: %u",csid);
    --printf("RESULT: %u",option);
end;