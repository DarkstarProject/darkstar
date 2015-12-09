-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Desert Beetle
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,136,1);
end;
