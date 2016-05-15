-----------------------------------
-- Area: Tahrongi Canyon
--  MOB: Canyon Crawler
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,96,1);
end;
