---------------------------------------------
-- Citadel Buster
-- Deals extreme Light damage to players in an area of effect.
-- Additional effect: Enmity reset
-- Damage can be approximated based on Calculating Weapon Skill Damage as a magical WS with a level of 85, fTP of 6 and MAB of 4.0. Or, more simply:
-- 2088/(1+MDB%) * (256-MDT)/256 (no day/weather bonus)
-- 2608/MDB * (256-MDT)/256 (weather bonus)
-- 2816/MDB * (256-MDT)/256 (day+weather bonus)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/weather")
local ID = require("scripts/zones/Temenos/IDs")

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    local phase = mob:getLocalVar("battlePhase")
    if (phase == 4) then
        mob:setLocalVar("citadelBuster", 1)
        mob:SetMobAbilityEnabled(false)
        mob:SetMagicCastingEnabled(false)
        mob:SetAutoAttackEnabled(false)
        mob:setMobMod(dsp.mobMod.DRAW_IN, 1)
        local battlefield = mob:getBattlefield()
        local players = battlefield:getPlayers()
        for _, member in pairs(players) do
            member:messageSpecial(ID.text.CITADEL_BASE)
        end
        mob:timer(10000, function(mob)
            for _, member in pairs(players) do
                member:messageSpecial(ID.text.CITADEL_BASE+1)
            end
            mob:timer(10000, function(mob)
                for _, member in pairs(players) do
                    member:messageSpecial(ID.text.CITADEL_BASE+2)
                end
                mob:timer(5000, function(mob)
                    for _, member in pairs(players) do
                        member:messageSpecial(ID.text.CITADEL_BASE+3)
                    end
                    mob:timer(1000, function(mob)
                        for _, member in pairs(players) do
                            member:messageSpecial(ID.text.CITADEL_BASE+4)
                        end
                        mob:timer(1000, function(mob)
                            for _, member in pairs(players) do
                                member:messageSpecial(ID.text.CITADEL_BASE+5)
                            end
                            mob:timer(1000, function(mob)
                                for _, member in pairs(players) do
                                    member:messageSpecial(ID.text.CITADEL_BASE+6)
                                end
                                mob:timer(1000, function(mob)
                                    for _, member in pairs(players) do
                                        member:messageSpecial(ID.text.CITADEL_BASE+7)
                                    end
                                    mob:timer(1000, function(mob)
                                        mob:useMobAbility(1540)
                                    end)
                                end)
                            end)
                        end)
                    end)
                end)
            end)
        end)
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local basedmg = 2088
    if mob:getWeather() == dsp.weather.AURORAS or mob:getWeather() == dsp.weather.STELLAR_GLARE then basedmg = basedmg + 520 end
    if VanadielDayElement() == dsp.day.LIGHTSDAY then basedmg = basedmg + 208 end
    local damage = basedmg/(1+(target:getMod(dsp.mod.MDEF)/100))
    local dmg = MobFinalAdjustments(damage,mob,skill,target,dsp.attackType.MAGICAL,dsp.damageType.LIGHT,MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, dsp.attackType.MAGICAL, dsp.damageType.LIGHT)
    mob:resetEnmity(target)
    mob:SetMagicCastingEnabled(true)
    mob:SetAutoAttackEnabled(true)
    mob:SetMobAbilityEnabled(true)
    mob:setMobMod(dsp.mobMod.DRAW_IN, 0)
    return dmg
end
