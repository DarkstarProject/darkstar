-----------------------------------
-- Area: Meriphataud Mountains
--  MOB: Patripatan
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,63,1);
end;
