-----------------------------------
-- Area: Rolanberry Fields
--  MOB: Copper Quadav
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,87,2);
end;
