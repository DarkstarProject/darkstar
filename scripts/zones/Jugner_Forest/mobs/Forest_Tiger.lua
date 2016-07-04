-----------------------------------
-- Area: Jugner Forest
--  MOB: Forest Tiger
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,14,2);
end;
