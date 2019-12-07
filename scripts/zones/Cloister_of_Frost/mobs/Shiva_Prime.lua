-----------------------------------
-- Area: Cloister of Frost
--  Mob: Shiva Prime
-- Involved in Quest: Trial by Ice, Trial Size Trial by Ice
-- Involved in Mission: ASA-4 Sugar Coated Directive
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    -- ASA-4: Avatar is Unkillable Until Its Used Astral Flow At Least 5 times At Specified Intervals
    if mob:getBattlefieldID() == 484 then
        mob:setLocalVar("astralflows", 0)
        mob:setUnkillable(true)
    end
end

function onMobFight(mob, target)
    -- ASA-4: Astral Flow Behavior - Guaranteed to Use At Least 5 times before killable, at specified intervals.
    if mob:getBattlefieldID() == 484 and mob:getCurrentAction() == dsp.act.ATTACK then
        local astralFlows = mob:getLocalVar("astralflows")
        if (astralFlows == 0 and mob:getHPP() <= 80)
        or (astralFlows == 1 and mob:getHPP() <= 60)
        or (astralFlows == 2 and mob:getHPP() <= 40)
        or (astralFlows == 3 and mob:getHPP() <= 20)
        or (astralFlows == 4 and mob:getHPP() <= 1) then
            mob:setLocalVar("astralflows", astralFlows + 1)
            mob:useMobAbility(884)
            if astralFlows >= 5 then
                mob:setUnkillable(false)
            end
        end
    end
end

function onMobDeath(mob, player, isKiller)
end
