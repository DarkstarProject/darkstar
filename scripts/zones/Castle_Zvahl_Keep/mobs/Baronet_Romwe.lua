-----------------------------------
-- Area: 
-- NPC:  Baronet_Romwe
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
    
    -- Set Baronet_Romwe's Window Open Time
    wait = math.random((3600),(28800));
    SetServerVariable("[POP]Baronet_Romwe", os.time(t) + wait); -- 1-8 hours
    DeterMob(mob:getID(), true);
    
    -- Set PH back to normal, then set to respawn spawn
    PH = GetServerVariable("[PH]Baronet_Romwe");
    SetServerVariable("[PH]Baronet_Romwe", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));
    
end;