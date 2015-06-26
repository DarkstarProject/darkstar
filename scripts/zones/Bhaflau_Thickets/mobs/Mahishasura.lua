-----------------------------------	
-- Area: Bhaflau Thickets
-- NM:   Mahishasura
-- @pos 206.510 -16.320 357.724 52
-----------------------------------	

require("scripts/zones/Bhaflau_Thickets/MobIDs");
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	

    -- Set Mahishasura's ToD
    SetServerVariable("[POP]Mahishasura", os.time(t) + 10800); -- 3 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    PH = GetServerVariable("[PH]Mahishasura");
    SetServerVariable("[PH]Mahishasura", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));
  
end;
