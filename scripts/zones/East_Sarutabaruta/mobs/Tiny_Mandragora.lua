-----------------------------------
-- Area: East Sarutabaruta
--  MOB: Tiny Mandragora
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,89,1);
end;
