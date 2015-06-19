-----------------------------------	
-- Area: North Gustaberg	
-- MOB:  Walking Sapling	
-- Note: Place Holder For Maighdean Uaine
-----------------------------------	

require("scripts/zones/North_Gustaberg/MobIDs");
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
    checkRegime(killer,mob,18,2);
    mob = mob:getID();
    if (Maighdean_Uaine_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Maighdean_Uaine");
        if (ToD <= os.time(t) and GetMobAction(Maighdean_Uaine) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Maighdean_Uaine);
                GetMobByID(Maighdean_Uaine):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Maighdean_Uaine", mob);
                DeterMob(mob, true);
            end
        end
    end
end;	
