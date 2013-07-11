-----------------------------------
--  Area: Ghelsba Outpost (140)
--   Mob: Orcish_Neckchopper
-----------------------------------

require("scripts/zones/Ghelsba_Outpost/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    mob = mob:getID();
    if (Thousandarm_Deshglesh_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Thousandarm_Deshglesh");
        if (ToD <= os.time(t) and GetMobAction(Thousandarm_Deshglesh) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Thousandarm_Deshglesh);
                GetMobByID(Thousandarm_Deshglesh):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Thousandarm_Deshglesh", mob);
                DeterMob(mob, true);
            end
        end
    end
end;
