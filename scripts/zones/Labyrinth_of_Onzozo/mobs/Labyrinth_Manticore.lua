-----------------------------------
-- Area: Labyrinth of Onzozo
--  MOB: Labyrinth Manticore
-- Note: Place holder Narasimha
-----------------------------------

require("scripts/zones/Labyrinth_of_Onzozo/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)

    checkGoVregime(ally,mob,775,2);

    local mob = mob:getID();
    if (Narasimha_PH[mob] ~= nil) then

        local ToD = GetServerVariable("[POP]Narasimha");
        if (ToD <= os.time(t) and GetMobAction(Narasimha) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Narasimha);
                GetMobByID(Narasimha):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Narasimha", mob);
                DeterMob(mob, true);
            end
        end
    end
end;