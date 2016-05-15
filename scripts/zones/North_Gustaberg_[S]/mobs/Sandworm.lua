-----------------------------------
-- Area: Crystal War Areas
--  MOB: Sandworm
-- Note:  Title Given if Sandworm does not Doomvoid
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
    player:addTitle(SANDWORM_WRANGLER);
end;