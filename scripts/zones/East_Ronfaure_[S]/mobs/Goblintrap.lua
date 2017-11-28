-----------------------------------
-- Area: East Ronfaure [S]
--  MOB: Goblintrap
-- Note: Goblintrap NM
-- !pos 168 0 -440 81
-----------------------------------

require("scripts/zones/East_Ronfaure_[S]/MobIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    SetServerVariable("[POP]Goblintrap", os.time() + 3600);
    GetMobByID(mob:getID()):setRespawnTime(0);
    DisallowRespawn(GOBLIN_TRAP_PH, false);
    
end;
