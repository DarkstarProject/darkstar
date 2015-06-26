----------------------------------	
-- Area: South Gustaberg	
--  MOB: Ornery Sheep
-- Note: Place holder Carnero
-----------------------------------	

require("scripts/zones/South_Gustaberg/MobIDs");
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
  
    mob = mob:getID();
    if (Carnero_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Carnero");
        if (ToD <= os.time(t) and GetMobAction(Carnero) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Carnero);
                GetMobByID(Carnero):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Carnero", mob);
                DeterMob(mob, true);
            end
        end
    end
  
end;	
