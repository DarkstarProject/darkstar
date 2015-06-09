-----------------------------------	
-- Area: Western Altepa Desert	
-- MOB:  Desert Dhalmel	
-- Note: Place holder for Celphie
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
require("scripts/zones/Western_Altepa_Desert/MobIDs");
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	

	checkRegime(killer,mob,135,1);
  
    mob = mob:getID();
    if (Celphie_PH[mob] ~= nil) then
        ToD = GetServerVariable("[POP]Celphie");
        if (ToD <= os.time(t) and GetMobAction(Celphie) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Celphie);
                GetMobByID(Celphie):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Celphie", mob);
                DeterMob(mob, true);
            end
        end
    end
  
end;	
