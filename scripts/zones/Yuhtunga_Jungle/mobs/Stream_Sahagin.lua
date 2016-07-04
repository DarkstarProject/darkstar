-----------------------------------
-- Area: Yuhtunga Jungle
--  MOB: Stream Sahagin
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,127,1);
end;
