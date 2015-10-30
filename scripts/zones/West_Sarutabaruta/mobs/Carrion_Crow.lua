-----------------------------------	
-- Area: West Sarutabaruta	
-- MOB:  Carrion Crow	
-- Note: PH for Nunyenunc
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
require("scripts/zones/West_Sarutabaruta/MobIDs");

-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,28,2);
    
    mob = mob:getID();
    if (Nunyenunc_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Nunyenunc");
        if (ToD <= os.time(t) and GetMobAction(Nunyenunc) == 0) then
            if (math.random((1),(10)) == 5) then
                UpdateNMSpawnPoint(Nunyenunc);
                GetMobByID(Nunyenunc):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Nunyenunc", mob);
                DeterMob(mob, true);
            end
        end
    end
    
end;	
