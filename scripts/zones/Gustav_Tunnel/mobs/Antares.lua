----------------------------------	
-- Area: Gustav Tunnel	
--  MOB: Antares
-- Note: Place holder Amikiri
-----------------------------------	

require("/scripts/zones/Gustav_Tunnel/MobIDs");
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
  
    mob = mob:getID();
    if (Amikiri_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Amikiri");
        if (ToD <= os.time(t) and GetMobAction(Amikiri) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Amikiri);
                GetMobByID(Amikiri):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Amikiri", mob);
                DeterMob(mob, true);
            end
        end
    end
  
end;	
