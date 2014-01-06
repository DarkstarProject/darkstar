-----------------------------------
-- Area: Riverne - Site B01
-- NPC:  Imdugud
-- @pos 655.263 20.664 651.320 29
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

    -- Set Imduguds ToD
    SetServerVariable("[POP]Imdugud", os.time(t) + 75600); -- 21 hour
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Imdugud");
    SetServerVariable("[PH]Imdugud", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));
end