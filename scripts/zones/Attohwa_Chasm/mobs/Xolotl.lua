-----------------------------------
-- Area: Attohwa Chasm
--  MOB: Xolotl
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setRespawnTime(0, true);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(XOLOTL_XTRAPOLATOR);
    -- Do not respawn Xolotl for 21-24 hours
    mob:setRespawnTime(math.random(75600,86400), true);
end;