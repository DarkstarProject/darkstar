-----------------------------------
-- Area: North Gustaberg
--  MOB: Walking Sapling
-- Note: Place Holder For Maighdean Uaine
-----------------------------------

require("scripts/zones/North_Gustaberg/MobIDs");
require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,18,2);

    local mobID = mob:getID();
    if (Maighdean_Uaine_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Maighdean_Uaine");
        if (ToD <= os.time(t) and GetMobAction(Maighdean_Uaine) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Maighdean_Uaine);
                GetMobByID(Maighdean_Uaine):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Maighdean_Uaine", mobID);
                DeterMob(mobID, true);
            end
        end
    end
end;
