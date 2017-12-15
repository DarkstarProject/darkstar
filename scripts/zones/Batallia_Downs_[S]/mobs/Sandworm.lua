-----------------------------------
-- Area: Batallia_Downs_[S]
--  MOB: Sandworm
-- Note: Title Given if Sandworm does not Doomvoid
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(SANDWORM_WRANGLER);
end;