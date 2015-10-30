----------------------------------	
-- Area: Gustav Tunnel	
--  MOB: Typhoon Wyvern
-- Note: Place holder Ungur
-----------------------------------	

require("scripts/zones/Gustav_Tunnel/MobIDs");
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
  
	checkGoVregime(killer,mob,769,2);
  
    local mob = mob:getID();
    if (Ungur_PH[mob] ~= nil) then

        local ToD = GetServerVariable("[POP]Ungur");
        if (ToD <= os.time(t) and GetMobAction(Ungur) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Ungur);
                GetMobByID(Ungur):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Ungur", mob);
                DeterMob(mob, true);
            end
        end
    end
  
end;	
