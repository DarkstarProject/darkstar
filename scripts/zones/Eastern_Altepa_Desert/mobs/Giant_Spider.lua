-----------------------------------	
-- Area: Eastern Altepa Desert	
-- MOB:  Giant Spider	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");
require("scripts/zones/Eastern_Altepa_Desert/MobIDs");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	

    checkRegime(killer,mob,109,1);

    mob = mob:getID();
    if (Dune_Widow_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Dune_Widow");
        if (ToD <= os.time(t) and GetMobAction(Dune_Widow) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Dune_Widow);
                GetMobByID(Dune_Widow):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Dune_Widow", mob);
                DeterMob(mob, true);
            end
        end
    end
  
end;	
