-----------------------------------
--  Area: Castle Zvahl Keep (162)
--   Mob: Demon_Warlock
-----------------------------------

require("scripts/zones/Castle_Zvahl_Keep/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    mob = mob:getID();
    if (Viscount_Morax_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Viscount_Morax");
        if (ToD <= os.time(t) and GetMobAction(Viscount_Morax) == 0) then
            if (math.random((1),(10)) == 5) then
                UpdateNMSpawnPoint(Viscount_Morax);
                GetMobByID(Viscount_Morax):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Viscount_Morax", mob);
                DeterMob(mob, true);
            end
        end
    end

end;

