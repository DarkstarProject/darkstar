-----------------------------------
-- Area:
--  MOB: Viscount_Morax
-----------------------------------
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(HELLSBANE);

    -- Set Viscount_Morax's Window Open Time
    local wait = math.random((3600),(28800));
    SetServerVariable("[POP]Viscount_Morax", os.time(t) + wait); -- 1-8 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Viscount_Morax");
    SetServerVariable("[PH]Viscount_Morax", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;