-----------------------------------
--  Area: Korroloka Tunnel (173)
--   Mob: Huge_Spider
-----------------------------------

require("scripts/zones/Korroloka_Tunnel/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

    checkGoVregime(killer,mob,279,1);

    mob = mob:getID();
    if (Falcatus_Aranei_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Falcatus_Aranei");
        if (ToD <= os.time(t) and GetMobAction(Falcatus_Aranei) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Falcatus_Aranei);
                GetMobByID(Falcatus_Aranei):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Falcatus_Aranei", mob);
                DeterMob(mob, true);
            end
        end
    end

end;

