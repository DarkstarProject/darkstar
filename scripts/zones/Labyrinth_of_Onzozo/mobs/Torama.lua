-----------------------------------
-- Area: Labyrinth of Onzozo
-- MOB:  Torama
-- Note: Place holder Ose
-----------------------------------

require("scripts/zones/Labyrinth_of_Onzozo/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

    checkGoVregime(killer,mob,775,1);

    local mob = mob:getID();
    if (Ose_PH[mob] ~= nil) then

        local ToD = GetServerVariable("[POP]Ose");
        if (ToD <= os.time(t) and GetMobAction(Ose) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Ose);
                GetMobByID(Ose):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Ose", mob);
                DeterMob(mob, true);
            end
        end
    end
end;
