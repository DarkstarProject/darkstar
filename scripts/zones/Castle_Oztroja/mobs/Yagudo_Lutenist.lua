-----------------------------------
--  Area: Castle Oztroja (151)
--   Mob: Yagudo_Lutenist
-----------------------------------

require("scripts/zones/Castle_Oztroja/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    mob = mob:getID();
    if (Yaa_Haqa_the_Profane_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Yaa_Haqa_the_Profane");
        if (ToD <= os.time(t) and GetMobAction(Yaa_Haqa_the_Profane) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Yaa_Haqa_the_Profane);
                GetMobByID(Yaa_Haqa_the_Profane):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Yaa_Haqa_the_Profane", mob);
                DeterMob(mob, true);
            end
        end
    end

end;

