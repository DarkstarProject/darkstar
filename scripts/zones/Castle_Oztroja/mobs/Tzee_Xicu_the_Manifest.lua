-----------------------------------
-- Area: Castle Oztroja
--   NM: Tzee Xicu the Manifest
-- TODO: messages should be zone-wide
-----------------------------------
package.loaded["scripts/zones/Castle_Oztroja/TextIDs"] = nil
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/zones/Castle_Oztroja/TextIDs")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onMobEngaged(mob,target)
    mob:showText(mob, YAGUDO_KING_ENGAGE)
end

function onAdditionalEffect(mob, player)
    local resist = applyResistanceAddEffect(mob,player,dsp.magic.ele.ICE,dsp.effect.PARALYSIS)
    if resist <= 0.5 then
        return 0,0,0
    else
        local duration = 60
        local power = 20
        duration = duration * resist
        if not player:hasStatusEffect(dsp.effect.PARALYSIS) then
            player:addStatusEffect(dsp.effect.PARALYSIS, power, 0, duration)
        end
        return dsp.subEffect.PARALYSIS, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.PARALYSIS
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.DEITY_DEBUNKER)
    if isKiller then
        mob:showText(mob, YAGUDO_KING_DEATH)
    end
end

function onMobDespawn(mob)
    -- reset hqnm system back to the nm placeholder
    local nqId = mob:getID() - 3
    SetServerVariable("[POP]Tzee_Xicu_the_Manifest", os.time() + 259200) -- 3 days
    SetServerVariable("[PH]Tzee_Xicu_the_Manifest", 0)
    DisallowRespawn(mob:getID(), true)
    DisallowRespawn(nqId, false)
    UpdateNMSpawnPoint(nqId)
    GetMobByID(nqId):setRespawnTime(math.random(75600, 86400))
end

