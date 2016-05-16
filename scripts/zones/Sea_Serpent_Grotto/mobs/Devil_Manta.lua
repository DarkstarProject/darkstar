-----------------------------------
-- Area: Sea Serpent Grotto
--  MOB: Devil Manta
-- Note: Place holder Charybdis
-----------------------------------

require("scripts/globals/groundsofvalor");
require("scripts/zones/Sea_Serpent_Grotto/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,810,2);

    local mobID = mob:getID();
    if (Charybdis_PH[mobID] ~= nil) then
        local Charybdis_ToD = GetServerVariable("[POP]Charybdis");
        if (Charybdis_ToD <= os.time(t) and GetMobAction(Charybdis) == 0 and math.random((1),(10)) == 10) then
            UpdateNMSpawnPoint(Charybdis);
            GetMobByID(Charybdis):setRespawnTime(GetMobRespawnTime(mobID));
            SetServerVariable("[PH]Charybdis", mobID);
            DeterMob(mobID, true);
        else
            local r = math.random(1,2);
            if (mobID ~= Charybdis_PH[r]) then -- what is this?
                DeterMob(mobID, true);
                DeterMob(Charybdis_PH[r], false);
                GetMobByID(Charybdis_PH[r]):setRespawnTime(GetMobRespawnTime(mobID));
            end
        end
    end

end;
