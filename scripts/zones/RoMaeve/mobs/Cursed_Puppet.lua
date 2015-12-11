-----------------------------------
-- Area: RoMaeve
--  MOB: Cursed Puppet
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,121,1);
end;
