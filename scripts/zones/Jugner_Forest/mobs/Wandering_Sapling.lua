-----------------------------------
-- Area: Jugner Forest
--  MOB: Wandering Sapling
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,58,1);
end;
