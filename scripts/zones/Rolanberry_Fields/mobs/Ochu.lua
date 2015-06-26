-----------------------------------	
-- Area: Rolanberry Fields	
-- MOB:  Ochu	
-- Note: PH for Drooling Daisy
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
require("scripts/zones/Rolanberry_Fields/MobIDs");
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	

    checkRegime(killer,mob,88,1);

    mob = mob:getID();
    if (Drooling_Daisy_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Drooling_Daisy");
        if (ToD <= os.time(t) and GetMobAction(Drooling_Daisy) == 0) then
            if (math.random((1),(10)) == 5) then
                UpdateNMSpawnPoint(Drooling_Daisy);
                GetMobByID(Drooling_Daisy):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Drooling_Daisy", mob);
                DeterMob(mob, true);
            end
        end
    end
  
end;	
