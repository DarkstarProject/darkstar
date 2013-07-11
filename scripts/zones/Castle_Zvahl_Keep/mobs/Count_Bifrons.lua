-----------------------------------
-- Area: 
-- NPC:  Count_Bifrons
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
    
    -- Set Count_Bifrons's Window Open Time
    wait = math.random((3600),(28800));
    SetServerVariable("[POP]Count_Bifrons", os.time(t) + wait); -- 1-8 hours
    DeterMob(mob:getID(), true);
    
    -- Set PH back to normal, then set to respawn spawn
    PH = GetServerVariable("[PH]Count_Bifrons");
    SetServerVariable("[PH]Count_Bifrons", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));
    
end;