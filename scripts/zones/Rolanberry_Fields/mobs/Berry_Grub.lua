-----------------------------------
-- Area: Rolanberry Fields
--  MOB: Berry Grub
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,25,2);
    checkRegime(ally,mob,86,1);
    checkRegime(ally,mob,87,1);
end;
