-----------------------------------	
-- Area: Sauromugue Champaign	
-- MOB:  Tabar Beak	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
require("scripts/zones/Sauromugue_Champaign/MobIDs");
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	

    checkRegime(killer,mob,100,1);

    mob = mob:getID();
    if (Deadly_Dodo_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Deadly_Dodo");
        if (ToD <= os.time(t) and GetMobAction(Deadly_Dodo) == 0) then
            if (math.random((1),(3)) == 2) then
                UpdateNMSpawnPoint(Deadly_Dodo);
                GetMobByID(Deadly_Dodo):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Deadly_Dodo", mob);
                DeterMob(mob, true);
            end
        end
    end
  
end;	
