-----------------------------------
-- Area: Bostaunieux Oubliette (167)
--  Mob: Bloodsucker
-- Note: This script will be loaded for both the NM and non-NM mobs of this name.
-- !pos -21.776 16.983 -231.477 167
-----------------------------------
local ID = require("scripts/zones/Bostaunieux_Oubliette/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    if mob:getID() == ID.mob.BLOODSUCKER then
        mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1) -- "Has an Additional Effect of Drain on normal attacks"
    end
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.HP_DRAIN)
end

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 613, 1, dsp.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    if mob:getID() == ID.mob.BLOODSUCKER then
        UpdateNMSpawnPoint(mob)
        mob:setRespawnTime(3600)
    end
end
