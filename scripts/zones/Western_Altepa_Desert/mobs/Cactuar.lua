-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Cactuar
-- Note: Place holder for Cactuar_Cantautor
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/Western_Altepa_Desert/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,136,2);

    local mobID = mob:getID();
    if (Cactuar_Cantautor_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Cactuar_Cantautor");
        if (ToD <= os.time(t) and GetMobAction(Cactuar_Cantautor) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Cactuar_Cantautor);
                GetMobByID(Cactuar_Cantautor):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Cactuar_Cantautor", mobID);
                DeterMob(mobID, true);
            end
        end
    end

end;
