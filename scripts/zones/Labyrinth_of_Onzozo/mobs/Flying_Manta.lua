-----------------------------------
-- Area: Labyrinth of Onzozo
--  MOB: Flying Manta
-- Note: Place holder Lord of Onzozo
-----------------------------------

require("scripts/zones/Labyrinth_of_Onzozo/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

    checkGoVregime(killer,mob,774,1);

    local mob = mob:getID();
    if (Lord_of_Onzozo_PH[mob] ~= nil) then

        local ToD = GetServerVariable("[POP]Lord_of_Onzozo");
        if (ToD <= os.time(t) and GetMobAction(Lord_of_Onzozo) == 0) then
            if (math.random((1),(25)) == 5) then
                UpdateNMSpawnPoint(Lord_of_Onzozo);
                GetMobByID(Lord_of_Onzozo):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Lord_of_Onzozo", mob);
                DeterMob(mob, true);
            end
        end
    elseif (Peg_Powler_PH[mob] ~= nil) then

        local ToD = GetServerVariable("[POP]Peg_Powler");
        if (ToD <= os.time(t) and GetMobAction(Peg_Powler) == 0) then
            if (math.random((1),(25)) == 5) then
                UpdateNMSpawnPoint(Peg_Powler);
                GetMobByID(Peg_Powler):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Peg_Powler", mob);
                DeterMob(mob, true);
            end
        end
    end;
end;
