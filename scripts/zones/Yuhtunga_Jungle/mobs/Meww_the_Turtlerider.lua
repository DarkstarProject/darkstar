-----------------------------------
-- Area: Yuhtunga Jungle
--  MOB: Meww the Turtlerider
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,127,1);
end;
