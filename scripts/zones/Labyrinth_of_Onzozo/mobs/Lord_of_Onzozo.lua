----------------------------------
-- Area: Labyrinth of Onzozo
--   NM: Lord of Onzozo
-----------------------------------


-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,774,1);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

    -- Set LoO's Window Open Time
    local wait = math.random((75600),(86400));
    SetServerVariable("[POP]Lord_of_Onzozo", os.time() + wait); -- 18-24 hours
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Lord_of_Onzozo");
    SetServerVariable("[PH]Lord_of_Onzozo", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;
