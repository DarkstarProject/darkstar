-----------------------------------
-- Area: The Sanctuary of ZiTah
--  MOB: Goobbue Parasite
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,116,1);
    checkRegime(player,mob,117,2);
end;
