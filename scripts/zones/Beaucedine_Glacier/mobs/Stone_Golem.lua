-----------------------------------
--  Area: Beaucedine Glacier (111)
--  Mob:  Stone_Golem
--  Note: PH for Gargantua
-----------------------------------

require("scripts/zones/Beaucedine_Glacier/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    mob = mob:getID();
    if (Gargantua_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Gargantua");
        if (ToD <= os.time(t) and GetMobAction(Gargantua) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Gargantua);
                GetMobByID(Gargantua):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Gargantua", mob);
                DeterMob(mob, true);
            end
        end
    end

end;

