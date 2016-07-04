-----------------------------------
-- Area: The Sanctuary of ZiTah
--  MOB: Ogrefly
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,114,1);
    checkRegime(player,mob,115,2);
end;
