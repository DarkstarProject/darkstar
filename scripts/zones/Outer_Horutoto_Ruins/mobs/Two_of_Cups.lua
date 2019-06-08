-----------------------------------
-- Area: Outer Horutoto
--  MOB: Two of Cups
-----------------------------------
require("scripts/globals/regimes")
local func = require("scripts/zones/Outer_Horutoto_Ruins/globals")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 663, 3, dsp.regime.type.GROUNDS)
    func.cardianAMKOrbDrop(player, dsp.ki.ORB_OF_CUPS, 10)
end