-----------------------------------	
-- Area: Buburimu Peninsula	
-- MOB:  Shoal Pugil	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
require("scripts/zones/Buburimu_Peninsula/MobIDs");

-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
    checkRegime(killer,mob,62,1);
    
    local mob = mob:getID();
    if (Buburimboo_PH[mob] ~= nil) then

        local ToD = GetServerVariable("[POP]Buburimboo");
        if (ToD <= os.time(t) and GetMobAction(Buburimboo) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Buburimboo);
                GetMobByID(Buburimboo):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Buburimboo", mob);
                DeterMob(mob, true);
            end
        end
    end
end;	
