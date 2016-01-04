-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Deinonychus
-- Note: Place Holder for Yowie
-----------------------------------

require("scripts/zones/Kuftal_Tunnel/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)

    checkGoVregime(ally,mob,740,1);

    local mob = mob:getID();
    if (Yowie_PH[mob] ~= nil) then

        local ToD = GetServerVariable("[POP]Yowie");
        if (ToD <= os.time(t) and GetMobAction(Yowie) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Yowie);
                GetMobByID(Yowie):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Yowie", mob);
                DeterMob(mob, true);
            end
        end
    end
end;
