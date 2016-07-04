-----------------------------------
-- Area: Meriphataud Mountains
--  MOB: Daggerclaw Dracos
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,39,1);
end;
