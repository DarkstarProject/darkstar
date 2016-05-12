-----------------------------------
-- Area: Jugner Forest
--  MOB: Screamer
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,58,2);
end;
