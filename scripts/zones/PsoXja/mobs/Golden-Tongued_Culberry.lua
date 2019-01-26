-----------------------------------
-- Area: Pso'xja
--   NM: Golden-Tongued Culberry
-----------------------------------
mixins = {require("scripts/mixins/families/tonberry")}
local ID = require("scripts/zones/PsoXja/IDs")
require("scripts/globals/status")
-----------------------------------

function onMobFight(mob,target)
    mob:SetAutoAttackEnabled(false)
    mob:SetMobAbilityEnabled(false)
    mob:setMobMod(dsp.mobMod.MAGIC_COOL, 6)
end

function onMobDeath(mob, player, isKiller)
end