-----------------------------------
--  Area: Castle Oztroja (151)
--   Mob: Yagudo_Theologist
-----------------------------------

require("scripts/zones/Castle_Oztroja/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    mob = mob:getID();
    if (Moo_Ouzi_the_Swiftblade_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Moo_Ouzi_the_Swiftblade");
        if (ToD <= os.time(t) and GetMobAction(Moo_Ouzi_the_Swiftblade) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Moo_Ouzi_the_Swiftblade);
                GetMobByID(Moo_Ouzi_the_Swiftblade):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Moo_Ouzi_the_Swiftblade", mob);
                DeterMob(mob, true);
            end
        end
    end

end;

