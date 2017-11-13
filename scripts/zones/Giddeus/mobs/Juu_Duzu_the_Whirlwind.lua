-----------------------------------
-- Area: Giddeus (145)
--  NM:  Juu_Duzu_the_Whirlwind
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

    -- Set Juu_Duzu_the_Whirlwind's Window Open Time
    SetServerVariable("[POP]Juu_Duzu_the_Whirlwind", os.time() + math.random((3600),(7200))); -- 1-2 hours
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Juu_Duzu_the_Whirlwind");
    SetServerVariable("[PH]Juu_Duzu_the_Whirlwind", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

