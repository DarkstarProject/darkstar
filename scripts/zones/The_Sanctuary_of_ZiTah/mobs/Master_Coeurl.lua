-----------------------------------
-- Area: The Sanctuary of ZiTah
--  MOB: Master Coeurl
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,117,1);
    checkRegime(player,mob,118,2);
end;
