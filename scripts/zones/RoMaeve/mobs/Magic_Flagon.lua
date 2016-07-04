-----------------------------------
-- Area: RoMaeve
--  MOB: Magic Flagon
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,120,1);
end;
