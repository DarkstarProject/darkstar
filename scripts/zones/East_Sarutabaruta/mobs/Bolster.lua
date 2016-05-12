-----------------------------------
-- Area: East Sarutabaruta
--  MOB: Bolster
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,92,2);
    checkRegime(player,mob,93,2);
end;
