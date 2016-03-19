-----------------------------------
-- Area: East Ronfaure
--  MOB: Carrion Worm
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/East_Ronfaure/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,65,1);

    local mobID = mob:getID();
    if (Bigmouth_Billy_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Bigmouth_Billy");
        if (ToD <= os.time(t) and GetMobAction(Bigmouth_Billy) == 0) then
            if (math.random(1,15) == 5) then
                UpdateNMSpawnPoint(Bigmouth_Billy);
                GetMobByID(Bigmouth_Billy):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Bigmouth_Billy", mobID);
                DeterMob(mobID, true);
            end
        end
    end

end;
