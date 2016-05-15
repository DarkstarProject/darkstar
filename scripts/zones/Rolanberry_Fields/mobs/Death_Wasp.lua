-----------------------------------
-- Area: Rolanberry Fields
--  MOB: Death Wasp
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,25,1);
    checkRegime(player,mob,85,1);
end;
