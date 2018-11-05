-----------------------------------
-- Area: Pso'xja
--  MOB: Golden-Tongued Culberry
-----------------------------------
mixins = {require("scripts/mixins/families/tonberry")}
local ID = require("scripts/zones/PsoXja/IDs")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onMobFight(mob,target)
    mob:SetAutoAttackEnabled(false)
    mob:SetMobAbilityEnabled(false)
    mob:setMobMod(dsp.mobMod.MAGIC_COOL, 6)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    GetNPCByID(ID.npc.GOLDEN_TONGUED_CULBERRY_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME)
end
