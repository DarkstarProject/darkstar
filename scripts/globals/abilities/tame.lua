-----------------------------------
-- Ability: Tame
-- Makes target docile and more susceptible to charm.
-- Obtained: Beastmaster Level 30
-- Recast Time: 10:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player,target,ability)
    if player:getPet() ~= nil then
        ability:setMsg(msgBasic.JA_NO_EFFECT)
        return 0
    end
    if target:getMobMod(MOBMOD_CHARMABLE) == 0 then
        ability:setMsg(msgBasic.JA_NO_EFFECT)
        return 0
    end
    if target:isEngaged() then
        local enmitylist = target:getEnmityList()
        if #enmitylist > 1 then
            ability:setMsg(msgBasic.JA_NO_EFFECT)
            return 0
        else
            for _,enmity in ipairs(enmitylist) do
                if enmity.entity:getID() ~= player:getID() then
                    ability:setMsg(msgBasic.JA_NO_EFFECT)
                    return 0
                else
                    if not enmity.tameable then
                        ability:setMsg(msgBasic.JA_NO_EFFECT)
                        return 0
                    end
                end
            end
        end
        local resist = applyResistanceAbility(player, target, ELE_NONE, SKILL_NON, player:getStat(MOD_INT) - target:getStat(MOD_INT))
        if resist <= 0.25 then
            ability:setMsg(msgBasic.JA_MISS_2)
            return 0
        else
            target:disengage()
        end
    else
        player:setLocalVar("Tamed_Mob",target:getID())
    end
end
