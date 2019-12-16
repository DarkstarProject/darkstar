require("scripts/globals/mixins")
require("scripts/globals/status")
-----------------------------------

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

local function dive(mob)
    mob:hideName(true)
    mob:untargetable(true)
    mob:SetAutoAttackEnabled(false)
    mob:SetMobAbilityEnabled(false)
    mob:AnimationSub(5)
end

local function surface(mob)
    mob:hideName(false)
    mob:untargetable(false)
    local animationSub = mob:AnimationSub()
    if animationSub == 0 or animationSub == 5 then
        mob:AnimationSub(6)
        mob:wait(2000)
    end
end

local function openMouth(mob)
    mob:addMod(dsp.mod.ATTP, 100)
    mob:addMod(dsp.mod.DEFP, -50)
    mob:addMod(dsp.mod.DMGMAGIC, -50)
    mob:setLocalVar("[hpemde]closeMouthHP", mob:getHP() - math.ceil(mob:getMaxHP() / 3))
    mob:AnimationSub(3)
    mob:wait(2000)
end

local function closeMouth(mob)
    mob:delMod(dsp.mod.ATTP, 100)
    mob:delMod(dsp.mod.DEFP, -50)
    mob:delMod(dsp.mod.DMGMAGIC, -50)
    mob:setLocalVar("[hpemde]changeTime", mob:getBattleTime() + 30)
    mob:AnimationSub(6)
    mob:wait(2000)
end

g_mixins.families.hpemde = function(mob)
    mob:addListener("SPAWN", "HPEMDE_SPAWN", function(mob)
        mob:setMod(dsp.mod.REGEN, 10)
        dive(mob)
    end)

    mob:addListener("ROAM_TICK", "HPEMDE_RTICK", function(mob)
        if mob:getHPP() == 100 then
            mob:setLocalVar("[hpemde]damaged", 0)
        end
        if mob:AnimationSub() ~= 5 then
            dive(mob)
        end
    end)

    mob:addListener("ENGAGE", "HPEMDE_ENGAGE", function(mob, target)
        mob:setLocalVar("[hpemde]disengageTime",  mob:getBattleTime() + 45)
        surface(mob)
    end)

    mob:addListener("MAGIC_TAKE", "HPEMDE_MAGIC_TAKE", function(target, caster, spell)
        target:setLocalVar("[hpemde]disengageTime",  target:getBattleTime() + 45)
    end)

    mob:addListener("COMBAT_TICK", "HPEMDE_CTICK", function(mob)
        if mob:getLocalVar("[hpemde]damaged") == 0 then
            local disengageTime = mob:getLocalVar("[hpemde]disengageTime")

            if mob:getHP() < mob:getMaxHP() then
                mob:SetAutoAttackEnabled(true)
                mob:SetMobAbilityEnabled(true)
                mob:setLocalVar("[hpemde]damaged", 1)
                mob:setLocalVar("[hpemde]changeTime", mob:getBattleTime() + 30)
            elseif disengageTime > 0 and mob:getBattleTime() > disengageTime then
                mob:setLocalVar("[hpemde]disengageTime",  0)
                mob:disengage()
            end
        else
            if mob:AnimationSub() == 6 and mob:getBattleTime() > mob:getLocalVar("[hpemde]changeTime") then
                openMouth(mob)
            elseif mob:AnimationSub() == 3 and mob:getHP() <  mob:getLocalVar("[hpemde]closeMouthHP") then
                closeMouth(mob)
            end
        end
    end)

    mob:addListener("CRITICAL_TAKE", "HPEMDE_CRITICAL_TAKE", function(mob)
        if mob:AnimationSub() == 3 then
           closeMouth(mob)
        end
    end)
end

return g_mixins.families.hpemde
