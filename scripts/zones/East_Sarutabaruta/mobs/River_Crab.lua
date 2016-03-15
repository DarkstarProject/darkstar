-----------------------------------
-- Area: East Sarutabaruta
--  MOB: River Crab
-- Note: PH for Duke Decapod
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/East_Sarutabaruta/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,92,1);
end;
