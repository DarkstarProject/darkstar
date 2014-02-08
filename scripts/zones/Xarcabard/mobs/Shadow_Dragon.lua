-----------------------------------	
-- Area: Xarcabard	
-- MOB:  Shadow_Dragon
-- ID: 17235987
-----------------------------------	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
        local B_ToD = GetServerVariable("[POP]Biast");
		local X = mob:getXPos();
		local Y = mob:getYPos();
		local Z = mob:getZPos();
        -- Check if Biast window is open, and there is not an Biast popped already(ACTION_NONE = 0)
        if (B_ToD <= os.time(t) and GetMobAction(17235988) == 0) then
            if (math.random(1,20) == 5) then
               -- printf("Biast will pop");
				SpawnMob(17235988);
				GetMobByID(17235988):setPos(X,Y,Z);
				GetMobByID(17235988):setSpawn(X,Y,Z);
				DeterMob(mob, true);
            end
        end
end;	
