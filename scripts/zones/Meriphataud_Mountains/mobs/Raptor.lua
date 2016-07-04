-----------------------------------
-- Area: Meriphataud Mountains
--  MOB: Raptor
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,39,1);
end;
