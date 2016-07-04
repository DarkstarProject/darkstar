-----------------------------------
-- Area: West Sarutabaruta
--  MOB: Bumblebee
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,61,2);
end;
