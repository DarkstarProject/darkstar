-----------------------------------
-- Area: Fort Ghelsba
--  NM:  Chariotbuster Byakzak
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    local OrcPanzer = 17354894;
    -- Set Orcish Panzer's respawn time to be 60-70 min from now.
    GetMobByID(OrcPanzer):setRespawnTime(math.random(3600,4200));
    -- Set Chariotbuster Byakzak's next respawn time respawn time (21-24 hours)
    SetServerVariable("Chariotbuster_Byakzak", (os.time() + math.random(75600,86400)));
end;
