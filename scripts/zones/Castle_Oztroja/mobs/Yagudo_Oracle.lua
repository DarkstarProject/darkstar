-----------------------------------
--  Area: Castle Oztroja (151)
--   Mob: Yagudo_Oracle
-----------------------------------

require("scripts/zones/Castle_Oztroja/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    mob = mob:getID();
    if (Quu_Domi_the_Gallant_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Quu_Domi_the_Gallant");
        if (ToD <= os.time(t) and GetMobAction(Quu_Domi_the_Gallant) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Quu_Domi_the_Gallant);
                GetMobByID(Quu_Domi_the_Gallant):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Quu_Domi_the_Gallant", mob);
                DeterMob(mob, true);
            end
        end
    end

end;

