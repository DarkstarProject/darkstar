-----------------------------------
-- Area: Waughroon Shrine
--  Mob: Fe'e
-- BCNM: Up In Arms
-----------------------------------
local ID = require("scripts/zones/Waughroon_Shrine/IDs")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.MULTI_HIT, 6)
    mob:setMod(dsp.mod.BINDRES, 20)
    mob:setMod(dsp.mod.BLINDRES, 20)
    mob:setMod(dsp.mod.SLEEPRES, 20)
    mob:setMod(dsp.mod.LULLABYRES, 20)
    mob:setMod(dsp.mod.GRAVITYRES, 20)
end

function onMobSpawn(mob)
    mob:setLocalVar("tentacles", 6)
    mob:SetMobSkillAttack(0)
end

-- Remove a tentacle from Fe'e.  This happens six times during the fight, with final at about 33% HP.
-- Each removal slows attack speed in exchange for TP regain and damage.
-- When all tentacles are removed, its normal melee attack is replaced by a special Ink Jet attack that
-- ignores shadows and has knockback.

function removeTentacle(mob, tentacles)
    if tentacles > 0 then
        mob:setMobMod(dsp.mobMod.MULTI_HIT, tentacles)
        mob:messageText(mob,ID.text.ONE_TENTACLE_WOUNDED, false)
    else
        mob:messageText(mob,ID.text.ALL_TENTACLES_WOUNDED, false)
        mob:SetMobSkillAttack(704) -- replace melee attack with special Ink Jet attack
    end
    mob:addMod(dsp.mod.ATT, 50)
    mob:addMod(dsp.mod.REGAIN, 50)
    mob:addMod(dsp.mod.BINDRES, 10)
    mob:addMod(dsp.mod.BLINDRES, 10)
    mob:addMod(dsp.mod.SLEEPRES, 10)
    mob:addMod(dsp.mod.LULLABYRES, 10)
    mob:addMod(dsp.mod.GRAVITYRES, 10)
end

function onMobFight(mob,target)
    local tentacles = mob:getLocalVar("tentacles")

    if tentacles > 0 then
        local hpp = mob:getHPP()

        while hpp < (11 * tentacles + 22) and tentacles > 0 do
            tentacles = tentacles - 1
            removeTentacle(mob, tentacles)
        end

        mob:setLocalVar("tentacles", tentacles)
    end
end

function onMobDeath(mob, player, isKiller)
end
