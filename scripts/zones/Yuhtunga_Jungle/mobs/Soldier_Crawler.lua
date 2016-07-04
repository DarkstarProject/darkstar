-----------------------------------
-- Area: Yuhtunga Jungle
--  MOB: Soldier Crawler
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,128,2);
end;
