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

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,46,1);
    checkRegime(ally,mob,47,1);

    -- Kirata
    mob = mob:getID();
    if (Kirata_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Kirata");
        if (ToD <= os.time(t) and GetMobAction(Kirata) == 0) then
            if (math.random((1),(15)) == 5) then
                UpdateNMSpawnPoint(Kirata);
                GetMobByID(Kirata):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Kirata", mob);
                DeterMob(mob, true);
            end
        end
    end

    -- Nue
    if (Nue_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Nue");
        if (ToD <= os.time(t) and GetMobAction(Nue) == 0) then
            if (math.random((1),(15)) == 5) then
                UpdateNMSpawnPoint(Nue);
                GetMobByID(Nue):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Nue", mob);
                DeterMob(mob, true);
            end
        end
    end
end;
