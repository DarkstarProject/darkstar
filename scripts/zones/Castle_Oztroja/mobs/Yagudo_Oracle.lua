-----------------------------------
-- Area: Castle Oztroja (151)
--  MOB: Yagudo_Oracle
-----------------------------------

require("scripts/zones/Castle_Oztroja/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    local mobID = mob:getID();
    if (Quu_Domi_the_Gallant_PH[mobID] ~= nil) then

        local ToD = GetServerVariable("[POP]Quu_Domi_the_Gallant");
        if (ToD <= os.time(t) and GetMobAction(Quu_Domi_the_Gallant) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Quu_Domi_the_Gallant);
                GetMobByID(Quu_Domi_the_Gallant):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Quu_Domi_the_Gallant", mobID);
                DeterMob(mobID, true);
            end
        end
    end

end;

