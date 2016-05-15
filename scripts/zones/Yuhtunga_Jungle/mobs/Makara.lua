-----------------------------------
-- Area: Yuhtunga Jungle
--  MOB: Makara
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,127,2);
end;
