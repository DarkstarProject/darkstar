-----------------------------------
--  Area: Yughott Grotto (142)
--   Mob: Orcish_Stonechucker
-----------------------------------

-- require("scripts/zones/Yughott_Grotto/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    mob = mob:getID();
    if (Ashmaker_Gotblut_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Ashmaker_Gotblut");
        if (ToD <= os.time(t) and GetMobAction(Ashmaker_Gotblut) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Ashmaker_Gotblut);
                GetMobByID(Ashmaker_Gotblut):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Ashmaker_Gotblut", mob);
                DeterMob(mob, true);
            end
        end
    end
    
end;