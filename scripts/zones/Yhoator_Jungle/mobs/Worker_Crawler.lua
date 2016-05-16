-----------------------------------
-- Area: Yhoator Jungle
--  MOB: Worker Crawler
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,132,1);
end;
