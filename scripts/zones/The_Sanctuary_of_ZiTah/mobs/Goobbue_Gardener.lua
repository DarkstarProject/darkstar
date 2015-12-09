-----------------------------------
-- Area: The Sanctuary of ZiTah
--  MOB: Goobbue Gardener
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,114,2);
end;
