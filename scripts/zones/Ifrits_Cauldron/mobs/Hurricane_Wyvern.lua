-----------------------------------
-- Area: Ifrit's Cauldron
--  Mob: Hurricane Wyvern
-- Note: PH for Vouivre
-----------------------------------
local ID = require("scripts/zones/Ifrits_Cauldron/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 762, 1, tpz.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.VOUIVRE_PH, 5, 7200) -- 2 hours
end
