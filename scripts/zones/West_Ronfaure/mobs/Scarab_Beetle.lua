-----------------------------------	
-- Area: West Ronfaure(100)
-- MOB:  Scarab Beetle	
-- Note: Place holder for Fungus Beetle
-----------------------------------	

require("scripts/globals/fieldsofvalor");	
require("scripts/zones/West_Ronfaure/MobIDs");

-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
    checkRegime(killer,mob,3,1);
    checkRegime(killer,mob,4,2);
    
    mob = mob:getID();
    if (Fungus_Beetle_PH[mob] ~= nil) then
        printf("Action:%u:%u",Fungus_Beetle,GetMobAction(Fungus_Beetle));
        ToD = GetServerVariable("[POP]Fungus_Beetle");
        if (ToD <= os.time(t) and GetMobAction(Fungus_Beetle) == 0) then
            if (math.random((1),(10)) == 5) then
                UpdateNMSpawnPoint(Fungus_Beetle);
                GetMobByID(Fungus_Beetle):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Fungus_Beetle", mob);
                DeterMob(mob, true);
            end
        end
    end
end;	
