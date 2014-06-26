-----------------------------------
--  Area: Korroloka Tunnel (173)
--   Mob: Clipper
-----------------------------------

-- require("scripts/zones/Korroloka_Tunnel/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

    checkGoVregime(killer,mob,731,1);

    mob = mob:getID();
    if (Cargo_Crab_Colin_PH[mob] ~= nil) then

        local ToD = GetServerVariable("[POP]Cargo_Crab_Colin");
        if (ToD <= os.time(t) and GetMobAction(Cargo_Crab_Colin) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Cargo_Crab_Colin);
                GetMobByID(Cargo_Crab_Colin):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Cargo_Crab_Colin", mob);
                DeterMob(mob, true);
            end
        end
    end

end;

