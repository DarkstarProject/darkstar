-----------------------------------
-- Area: Yhoator Jungle
--  MOB: Yhoator Wasp
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,130,2);
end;
