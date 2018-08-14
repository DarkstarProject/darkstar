-----------------------------------
--
-- Zone: Gusgen_Mines (196)
--
-----------------------------------
package.loaded["scripts/zones/Gusgen_Mines/TextIDs"] = nil;
----------------------------------
require("scripts/zones/Gusgen_Mines/TextIDs");
require("scripts/zones/Gusgen_Mines/MobIDs");
require("scripts/globals/conquest");
-----------------------------------

function onInitialize(zone)
    UpdateTreasureSpawnPoint(GUSGEN_TREASURE_CHEST);
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(100.007,-61.63,-237.441,187);
    end
    return cs;
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
