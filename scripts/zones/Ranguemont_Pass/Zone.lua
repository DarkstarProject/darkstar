-----------------------------------
--
-- Zone: Ranguemont_Pass (166)
--
-----------------------------------
package.loaded["scripts/zones/Ranguemont_Pass/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Ranguemont_Pass/TextIDs");
require("scripts/zones/Ranguemont_Pass/MobIDs");
require("scripts/globals/conquest");

function onInitialize(zone)
    -- pick a random Taisaijin PH and set its do not disturb time
    local phIndex = math.random(1,3);
    local ph = GetMobByID(TAISAIJIN_PH[phIndex]);
    ph:setLocalVar("timeToGrow", os.time() + math.random(86400,259200)); -- 1 to 3 days
    ph:setLocalVar("phIndex",phIndex);
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
        player:setPos(302.778,-68.131,257.759,137);
    end
    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
