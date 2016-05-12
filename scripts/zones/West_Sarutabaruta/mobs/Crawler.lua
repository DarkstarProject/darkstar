-----------------------------------
-- Area: West Sarutabaruta
--  MOB: Crawler
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,28,1);
    checkRegime(player,mob,29,2);
end;
