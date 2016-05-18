-----------------------------------
-- Area: East Sarutabaruta
--  MOB: Giant Bee
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,90,1);
end;
