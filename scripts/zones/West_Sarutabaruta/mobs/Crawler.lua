-----------------------------------
-- Area: West Sarutabaruta
--  MOB: Crawler
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,28,1);
    checkRegime(ally,mob,29,2);
end;
