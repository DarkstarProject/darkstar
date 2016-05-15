----------------------------------
-- Area: Gustav Tunnel
--  MOB: Nanoplasm
-----------------------------------
package.loaded["scripts/zones/Gustav_Tunnel/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Gustav_Tunnel/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local X = GetMobByID(17645797):getXPos();
    local Y = GetMobByID(17645797):getYPos();
    local Z = GetMobByID(17645797):getZPos();
    local X1 = GetMobByID(17645798):getXPos();
    local Y1 = GetMobByID(17645798):getYPos();
    local Z1 = GetMobByID(17645798):getZPos();
    local X2 = GetMobByID(17645799):getXPos();
    local Y2 = GetMobByID(17645799):getYPos();
    local Z2 = GetMobByID(17645799):getZPos();
    local X3 = GetMobByID(17645800):getXPos();
    local Y3 = GetMobByID(17645800):getYPos();
    local Z3 = GetMobByID(17645800):getZPos();

    if (mob:getID() == 17645797) then
        SpawnMob(17645801):setPos(X,Y,Z);
        SpawnMob(17645802):setPos(X,Y,Z);
        GetMobByID(17645801):updateEnmity(killer);
        GetMobByID(17645802):updateEnmity(killer);
    elseif (mob:getID() == 17645798) then
        SpawnMob(17645803):setPos(X1,Y1,Z1);
        SpawnMob(17645804):setPos(X1,Y1,Z1);
        GetMobByID(17645803):updateEnmity(killer);
        GetMobByID(17645804):updateEnmity(killer);
    elseif (mob:getID() == 17645799) then
        SpawnMob(17645805):setPos(X2,Y2,Z2);
        SpawnMob(17645806):setPos(X2,Y2,Z2);
        GetMobByID(17645805):updateEnmity(killer);
        GetMobByID(17645806):updateEnmity(killer);
    elseif (mob:getID() == 17645800) then
        SpawnMob(17645807):setPos(X3,Y3,Z3);
        SpawnMob(17645808):setPos(X3,Y3,Z3);
        GetMobByID(17645807):updateEnmity(killer);
        GetMobByID(17645808):updateEnmity(killer);
    end
end;
