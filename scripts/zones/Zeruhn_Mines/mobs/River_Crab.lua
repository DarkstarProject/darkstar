-----------------------------------
--  Area: Zeruhn Mines (172)
--   Mob: River_Crab
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,627,1);
end;
