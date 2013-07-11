-----------------------------------
-- Area: 
-- NPC:  Baron_Vapula
-----------------------------------
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    killer:addTitle(HELLSBANE);
    
    -- Set Baron_Vapula's Window Open Time
    wait = math.random((3600),(28800));
    SetServerVariable("[POP]Baron_Vapula", os.time(t) + wait); -- 1-8 hours
    DeterMob(mob:getID(), true);
    
    -- Set PH back to normal, then set to respawn spawn
    PH = GetServerVariable("[PH]Baron_Vapula");
    SetServerVariable("[PH]Baron_Vapula", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));
    
end;