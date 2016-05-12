-----------------------------------
-- Area: West Sarutabaruta
--  MOB: Giant Bee
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,61,2);
end;
