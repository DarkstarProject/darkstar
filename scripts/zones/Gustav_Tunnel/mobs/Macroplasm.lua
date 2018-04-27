----------------------------------
-- Area: Gustav Tunnel
--   NM: Macroplasm
-- Note: Part of mission "The Salt of the Earth"
-----------------------------------
require("scripts/zones/Gustav_Tunnel/MobIDs");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (isKiller) then
        local mobId = mob:getID();
        local offset = mobId - GIGAPLASM;
        local x = mob:getXPos();
        local y = mob:getYPos();
        local z = mob:getZPos();

        SpawnMob(mobId + offset + 1):setPos(x, y, z);
        SpawnMob(mobId + offset + 2):setPos(x-1, y, z-1);
        GetMobByID(mobId + offset + 1):updateEnmity(player);
        GetMobByID(mobId + offset + 2):updateEnmity(player);
    end
end;
