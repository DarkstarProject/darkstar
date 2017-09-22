-----------------------------------
-- Area: Sauromugue Champaign (120)
--  NM:  Deadly_Dodo
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

    -- Set Deadly_Dodo's Window Open Time
    SetServerVariable("[POP]Deadly_Dodo", os.time() + 3600); -- 1 hour
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn
    local PH = GetServerVariable("[PH]Deadly_Dodo");
    SetServerVariable("[PH]Deadly_Dodo", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;