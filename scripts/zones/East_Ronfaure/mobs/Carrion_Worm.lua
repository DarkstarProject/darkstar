-----------------------------------	
-- Area: East Ronfaure	
-- MOB:  Carrion Worm	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
require("scripts/zones/East_Ronfaure/MobIDs");

-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
    checkRegime(killer,mob,65,1);
    
    mob = mob:getID();
    if (Bigmouth_Billy_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Bigmouth_Billy");
        if (ToD <= os.time(t) and GetMobAction(Bigmouth_Billy) == 0) then
            if (math.random((1),(15)) == 5) then
                UpdateNMSpawnPoint(Bigmouth_Billy);
                GetMobByID(Bigmouth_Billy):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Bigmouth_Billy", mob);
                DeterMob(mob, true);
            end
        end
    end
    
end;	
