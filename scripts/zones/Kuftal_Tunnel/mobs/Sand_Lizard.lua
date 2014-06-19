-----------------------------------
-- Area: Kuftal Tunnel
-- MOB:  Sand Lizard
-- Note: Place Holder for Amemet
-----------------------------------

require("scripts/zones/Kuftal_Tunnel/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

    checkGoVregime(killer,mob,735,2);

    local mob = mob:getID();
    if (Amemet_PH[mob] ~= nil) then

        local ToD = GetServerVariable("[POP]Amemet");
        if (ToD <= os.time(t) and GetMobAction(Amemet) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Amemet);
                GetMobByID(Amemet):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Amemet", mob);
                DeterMob(mob, true);
            end
        end
    end
end;
