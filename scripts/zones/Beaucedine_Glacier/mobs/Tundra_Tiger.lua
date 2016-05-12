-----------------------------------
-- Area: Beaucedine Glacier
--  MOB: Tundra Tiger
-- Note: PH for Nue, Kirata
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/Beaucedine_Glacier/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,46,1);
    checkRegime(player,mob,47,1);

    -- Kirata
    local mobID = mob:getID();
    if (Kirata_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Kirata");
        if (ToD <= os.time(t) and GetMobAction(Kirata) == 0) then
            if (math.random(1,15) == 5) then
                UpdateNMSpawnPoint(Kirata);
                GetMobByID(Kirata):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Kirata", mobID);
                DeterMob(mobID, true);
            end
        end
    end

    -- Nue
    if (Nue_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Nue");
        if (ToD <= os.time(t) and GetMobAction(Nue) == 0) then
            if (math.random(1,15) == 5) then
                UpdateNMSpawnPoint(Nue);
                GetMobByID(Nue):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Nue", mobID);
                DeterMob(mobID, true);
            end
        end
    end
end;
