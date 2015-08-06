-----------------------------------	
-- Area: West Sarutabaruta	
-- MOB:  Mandragora	
-- Note: PH for Tom Tit Tat
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
require("scripts/zones/West_Sarutabaruta/MobIDs");
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	

	checkRegime(killer,mob,26,1);
    
    mob = mob:getID();
    if (Tom_Tit_Tat_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Tom_Tit_Tat");
        if (ToD <= os.time(t) and GetMobAction(Tom_Tit_Tat) == 0) then
            if (math.random((1),(15)) == 5) then
                UpdateNMSpawnPoint(Tom_Tit_Tat);
                GetMobByID(Tom_Tit_Tat):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Tom_Tit_Tat", mob);
                DeterMob(mob, true);
            end
        end
    end
    
end;	
