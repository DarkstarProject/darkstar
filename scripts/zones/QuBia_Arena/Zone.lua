-----------------------------------
--
-- Zone: Qu'Bia Arena (206)
--
-----------------------------------
package.loaded["scripts/zones/QuBia_Arena/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/QuBia_Arena/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;
    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
        player:setPos(-241.046,-25.86,19.991,0);
    end
    return cs;
end;

-----------------------------------
-- onConquestUpdate
-----------------------------------

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();
    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 32004) then
        if (player:getBattlefield():getBattlefieldNumber() == 1) then
            SpawnMob(17621014);
            SpawnMob(17621015);
            SpawnMob(17621016);
            local trion = player:getBattlefield():insertAlly(14183)
            trion:setSpawn(-403,-201,413,58);
            trion:spawn();
            player:setPos(-400,-201,419,61);
        elseif (player:getBattlefield():getBattlefieldNumber() == 2) then
            SpawnMob(17621028);
            SpawnMob(17621029);
            SpawnMob(17621030);
            local trion = player:getBattlefield():insertAlly(14183)
            trion:setSpawn(-3,-1,4,61);
            trion:spawn();
            player:setPos(0,-1,10,61);
        elseif (player:getBattlefield():getBattlefieldNumber() == 3) then
            SpawnMob(17621042);
            SpawnMob(17621043);
            SpawnMob(17621044);
            local trion = player:getBattlefield():insertAlly(14183)
            trion:setSpawn(397,198,-395,64);
            trion:spawn();
            player:setPos(399,198,-381,57);
        end
    end
end;
