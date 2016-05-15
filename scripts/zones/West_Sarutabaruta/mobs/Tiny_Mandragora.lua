-----------------------------------
-- Area: West Sarutabaruta
--  MOB: Tiny Mandragora
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,26,1);
end;
