-----------------------------------
-- Zone: Ilrusi_Atoll
--  zone 55
-----------------------------------
require("scripts/zones/Ilrusi_Atoll/globals");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;

    ILRUSI_ATOLL.randomizeFigurehead();

    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
