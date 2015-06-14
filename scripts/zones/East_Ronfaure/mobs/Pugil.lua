-----------------------------------	
-- Area: East Ronfaure	
-- MOB:  Pugil	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
require("scripts/zones/East_Ronfaure/MobIDs");

-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
    checkRegime(killer,mob,64,1);
    
    mob = mob:getID();
    if (Swamfisk_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Swamfisk");
        if (ToD <= os.time(t) and GetMobAction(Swamfisk) == 0) then
            if (math.random((1),(15)) == 5) then
                UpdateNMSpawnPoint(Swamfisk);
                GetMobByID(Swamfisk):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Swamfisk", mob);
                DeterMob(mob, true);
            end
        end
    end
    
end;	
