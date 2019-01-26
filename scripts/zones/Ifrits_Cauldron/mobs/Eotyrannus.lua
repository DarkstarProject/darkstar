-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Eotyrannus
-- Note: PH for Lindwurm
-----------------------------------
local ID = require("scripts/zones/Ifrits_Cauldron/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 758, 1, dsp.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.LINDWURM_PH, 5, 3600) -- 1 hour
end
