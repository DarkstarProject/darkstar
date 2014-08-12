-----------------------------------
-- Area: Kuftal Tunnel
-- MOB:  Sabotender Sediendo
-- Note: Place Holder for Sabotender Mariachi
-----------------------------------

require("scripts/zones/Kuftal_Tunnel/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

    checkGoVregime(killer,mob,738,2);

    local mob = mob:getID();
    if (Sabotender_Mariachi_PH[mob] ~= nil) then

        local ToD = GetServerVariable("[POP]Sabotender_Mariachi");
        if (ToD <= os.time(t) and GetMobAction(Sabotender_Mariachi) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Sabotender_Mariachi);
                GetMobByID(Sabotender_Mariachi):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Sabotender_Mariachi", mob);
                DeterMob(mob, true);
            end
        end
    end
end;
