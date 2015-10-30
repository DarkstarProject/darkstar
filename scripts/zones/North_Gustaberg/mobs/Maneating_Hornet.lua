-----------------------------------	
-- Area: North Gustaberg	
-- MOB:  Maneating Hornet	
-- Note: Place Holder For Stinging Sophie
-----------------------------------	

require("scripts/zones/North_Gustaberg/MobIDs");	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
    checkRegime(killer,mob,17,1);
    mob = mob:getID();
    if (Stinging_Sophie_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Stinging_Sophie");
        if (ToD <= os.time(t) and GetMobAction(Stinging_Sophie) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Stinging_Sophie);
                GetMobByID(Stinging_Sophie):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Stinging_Sophie", mob);
                DeterMob(mob, true);
            end
        end
    end
end;	
