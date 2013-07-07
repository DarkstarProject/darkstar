-----------------------------------	
-- Area: Kuftal Tunnel	
-- MOB:  Greater Cockatrice	
-- Note: Place Holder for Pelican
-----------------------------------	

require("scripts/zones/Kuftal_Tunnel/MobIDs");
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	

    mob = mob:getID();
    if (Pelican_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Pelican");
        if (ToD <= os.time(t) and GetMobAction(Pelican) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Pelican);
                GetMobByID(Pelican):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Pelican", mob);
                DeterMob(mob, true);
            end
        end
    end
    
end;	
