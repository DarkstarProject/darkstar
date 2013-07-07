-----------------------------------
--  Area: Crawlers' Nest (197)
--   Mob: Wespe
-----------------------------------

require("scripts/zones/Crawlers_Nest/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    mob = mob:getID();
    if (Demonic_Tiphia_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Demonic_Tiphia");
        if (ToD <= os.time(t) and GetMobAction(Demonic_Tiphia) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Demonic_Tiphia);
                GetMobByID(Demonic_Tiphia):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Demonic_Tiphia", mob);
                DeterMob(mob, true);
            end
        end
    end
end;
