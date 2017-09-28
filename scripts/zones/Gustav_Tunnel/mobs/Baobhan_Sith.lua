----------------------------------
-- Area: Gustav Tunnel
--   NM: Baobhan Sith
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

    -- Set Baobhan Sith's Window Open Time
    local wait = math.random(4,8) * 3600;
    SetServerVariable("[POP]Baobhan_Sith", os.time() + wait); -- 4-8 hours
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Baobhan_Sith");
    SetServerVariable("[PH]Baobhan_Sith", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;