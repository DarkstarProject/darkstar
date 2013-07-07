-----------------------------------
--  Area: Giddeus (145)
--   Mob: Yagudo_Persecutor
-----------------------------------

require("scripts/zones/Giddeus/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    mob = mob:getID();
    if (Juu_Duzu_the_Whirlwind_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Juu_Duzu_the_Whirlwind");
        if (ToD <= os.time(t) and GetMobAction(Juu_Duzu_the_Whirlwind) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Juu_Duzu_the_Whirlwind);
                GetMobByID(Juu_Duzu_the_Whirlwind):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Juu_Duzu_the_Whirlwind", mob);
                DeterMob(mob, true);
            end
        end
    end

end;

