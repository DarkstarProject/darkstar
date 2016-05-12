-----------------------------------
-- Area: Valkurm Dunes
--  MOB: Damselfly
-- Note: Place holder Valkurm Emperor
-----------------------------------

require("scripts/zones/Valkurm_Dunes/MobIDs");
require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,9,1);
    checkRegime(player,mob,10,2);

    local mobID = mob:getID();
    if (Valkurm_Emperor_PH[mobID] ~= nil) then
        local VE_ToD = GetServerVariable("[POP]Valkurm_Emperor");
        if (VE_ToD <= os.time(t) and GetMobAction(Valkurm_Emperor) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Valkurm_Emperor);
                GetMobByID(Valkurm_Emperor):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Valkurm_Emperor", mobID);
                DeterMob(mobID, true);
            end
        end
    end
end;
