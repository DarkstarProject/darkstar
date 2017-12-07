-----------------------------------
-- Area: Batallia Downs
--  MOB: Stalking Sapling
-----------------------------------
require("scripts/zones/Batallia_Downs/MobIDs");
require("scripts/globals/fieldsofvalor");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,72,1);
    checkRegime(player,mob,73,1);
end;

function onMobDespawn(mob)
    local mobID = mob:getID();

    if (TOTTERING_TOBY_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Tottering_Toby");
        if (ToD <= os.time() and not GetMobByID(TOTTERING_TOBY):isSpawned()) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(TOTTERING_TOBY);
                GetMobByID(TOTTERING_TOBY):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Tottering_Toby", mobID);
                DisallowRespawn(mobID, true);
            end
        end
    end
end;
