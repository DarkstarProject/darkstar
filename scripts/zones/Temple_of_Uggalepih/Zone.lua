-----------------------------------
--
-- Zone: Temple_of_Uggalepih (159)
--
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Temple_of_Uggalepih/TextIDs");
require("scripts/zones/Temple_of_Uggalepih/MobIDs");
require("scripts/globals/conquest");

function onInitialize(zone)
    UpdateTreasureSpawnPoint(UGGALEPIH_TREASURE_COFFER);
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(432.013,5.353,216.472,153);
    end
    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
