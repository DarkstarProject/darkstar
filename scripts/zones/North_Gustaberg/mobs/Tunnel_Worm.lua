-----------------------------------
-- Area: North Gustaberg
--  MOB: Tunnel Worm
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,16,1);
end;
