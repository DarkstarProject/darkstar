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

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,92,1);
end;
