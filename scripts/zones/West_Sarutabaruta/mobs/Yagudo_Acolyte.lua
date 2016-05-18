-----------------------------------
-- Area: West Sarutabaruta
--  MOB: Yagudo Acolyte
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,29,1);
    checkRegime(player,mob,61,1);
end;
