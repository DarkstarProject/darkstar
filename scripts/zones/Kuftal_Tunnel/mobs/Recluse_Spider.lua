-----------------------------------
-- Area: Kuftal Tunnel
-- MOB:  Recluse Spider
-- Note: Place Holder for Arachne
-----------------------------------

require("scripts/zones/Kuftal_Tunnel/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

    checkGoVregime(killer,mob,737,2);
    checkGoVregime(killer,mob,739,2);

    local mob = mob:getID();
    if (Arachne_PH[mob] ~= nil) then

        local ToD = GetServerVariable("[POP]Arachne");
        if (ToD <= os.time(t) and GetMobAction(Arachne) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Arachne);
                GetMobByID(Arachne):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Arachne", mob);
                DeterMob(mob, true);
            end
        end
    end
end;
