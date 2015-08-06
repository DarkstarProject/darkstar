-----------------------------------	
-- Area: East Sarutabaruta	
-- MOB:  Crawler	
-- Note: PH for Spiny Spipi
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
require("scripts/zones/East_Sarutabaruta/MobIDs");

-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
    checkRegime(killer,mob,92,2);
    checkRegime(killer,mob,93,2);
    
    mob = mob:getID();
    if (Spiny_Spipi_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Spiny_Spipi");
        if (ToD <= os.time(t) and GetMobAction(Spiny_Spipi) == 0) then
            if (math.random((1),(15)) == 5) then
                UpdateNMSpawnPoint(Spiny_Spipi);
                GetMobByID(Spiny_Spipi):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Spiny_Spipi", mob);
                DeterMob(mob, true);
            end
        end
    end
    
end;	
