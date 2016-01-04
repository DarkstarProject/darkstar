-----------------------------------
-- Area: Batallia Downs
--  MOB: Orcish Nightraider
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,74,3);
end;
