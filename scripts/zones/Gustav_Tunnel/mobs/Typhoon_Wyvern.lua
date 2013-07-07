----------------------------------	
-- Area: Gustav Tunnel	
--  MOB: Typhoon Wyvern
-- Note: Place holder Ungur
-----------------------------------	

require("/scripts/zones/Gustav_Tunnel/MobIDs");
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
  
    mob = mob:getID();
    if (Ungur_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Ungur");
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
