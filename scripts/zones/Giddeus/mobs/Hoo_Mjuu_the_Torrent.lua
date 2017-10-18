-----------------------------------
-- Area: Giddeus (145)
--  NM:  Hoo_Mjuu_the_Torrent
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

    -- Set Hoo_Mjuu_the_Torrent's Window Open Time
    SetServerVariable("[POP]Hoo_Mjuu_the_Torrent", os.time() + 3600); -- 1 hour
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Hoo_Mjuu_the_Torrent");
    SetServerVariable("[PH]Hoo_Mjuu_the_Torrent", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

