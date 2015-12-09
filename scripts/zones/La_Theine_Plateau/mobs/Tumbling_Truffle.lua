-----------------------------------
-- Area: La Theine Plateau
--  MOB: Tumbling Truffle
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,71,2);
end;
