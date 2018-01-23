-----------------------------------
-- Area: West Sarutabaruta
--  MOB: Yagudo Scribe
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,29,1);
    checkRegime(player,mob,61,1);
end;
