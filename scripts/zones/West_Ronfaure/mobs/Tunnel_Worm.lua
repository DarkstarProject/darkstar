-----------------------------------
-- Area: West Ronfaure
--  MOB: Tunnel Worm
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,1,1);
end;
