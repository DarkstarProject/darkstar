-----------------------------------
-- Global version of onMobDeath
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/quests")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/utils")
require("scripts/globals/zone")
require("scripts/globals/msg")
-----------------------------------

dsp = dsp or {}
dsp.mob = dsp.mob or {}

-- onMobDeathEx is called from the core
function onMobDeathEx(mob, player, isKiller, isWeaponSkillKill)
    -- Things that happen only to the person who landed killing blow
    if isKiller then
        -- DRK quest - Blade Of Darkness
        if
            (player:getQuestStatus(BASTOK, dsp.quest.id.bastok.BLADE_OF_DARKNESS) == QUEST_ACCEPTED or player:getQuestStatus(BASTOK, dsp.quest.id.bastok.BLADE_OF_DEATH) == QUEST_ACCEPTED) and
            player:getEquipID(dsp.slot.MAIN) == 16607 and
            player:getCharVar("ChaosbringerKills") < 200 and
            not isWeaponSkillKill
        then
            player:addCharVar("ChaosbringerKills", 1)
        end
    end

    -- Things that happen to any player in the party/alliance
    if player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.A_TESTING_TIME then
        if
            (player:getZoneID() == dsp.zone.BUBURIMU_PENINSULA and player:hasCompletedMission(WINDURST, dsp.mission.id.windurst.A_TESTING_TIME)) or
            (player:getZoneID() == dsp.zone.TAHRONGI_CANYON and not player:hasCompletedMission(WINDURST, dsp.mission.id.windurst.A_TESTING_TIME))
        then
            player:addCharVar("testingTime_crea_count", 1)
        end
    end
end

-------------------------------------------------
-- placeholder / lottery NMs
-------------------------------------------------

-- is a lottery NM already spawned or primed to pop?
local function lotteryPrimed(phList)
    local nm
    for k, v in pairs(phList) do
        nm = GetMobByID(v)
        if nm ~= nil and (nm:isSpawned() or nm:getRespawnTime() ~= 0) then
            return true
        end
    end
    return false
end

-- potential lottery placeholder was killed
dsp.mob.phOnDespawn = function(ph, phList, chance, cooldown, immediate)
    if type(immediate) ~= "boolean" then immediate = false end

    local phId = ph:getID()
    local nmId = phList[phId]

    if nmId ~= nil then
        local nm = GetMobByID(nmId)
        if nm ~= nil then
            local pop = nm:getLocalVar("pop")

            if os.time() > pop and not lotteryPrimed(phList) and math.random(100) <= chance then

                -- on PH death, replace PH repop with NM repop
                DisallowRespawn(phId, true)
                DisallowRespawn(nmId, false)
                UpdateNMSpawnPoint(nmId)
                nm:setRespawnTime(immediate and 1 or GetMobRespawnTime(phId)) -- if immediate is true, spawn the nm immediately (1ms) else use placeholder's timer

                nm:addListener("DESPAWN", "DESPAWN_" .. nmId, function(m)
                    -- on NM death, replace NM repop with PH repop
                    DisallowRespawn(nmId, true)
                    DisallowRespawn(phId, false)
                    GetMobByID(phId):setRespawnTime(GetMobRespawnTime(phId))
                    m:setLocalVar("pop", os.time() + cooldown)
                    m:removeListener("DESPAWN_" .. nmId)
                end)

                return true
            end
        end
    end

    return false
end

-------------------------------------------------
-- mob additional melee effects
-------------------------------------------------

dsp.mob.additionalEffect =
{
    BLIND      = 0,
    CURSE      = 1,
    ENAERO     = 2,
    ENBLIZZARD = 3,
    ENDARK     = 4,
    ENFIRE     = 5,
    ENLIGHT    = 6,
    ENSTONE    = 7,
    ENTHUNDER  = 8,
    ENWATER    = 9,
    EVA_DOWN   = 10,
    HP_DRAIN   = 11,
    MP_DRAIN   = 12,
    PARALYZE   = 13,
    PETRIFY    = 14,
    PLAGUE     = 15,
    POISON     = 16,
    SILENCE    = 17,
    SLOW       = 18,
    STUN       = 19,
    TERROR     = 20,
    TP_DRAIN   = 21,
}
dsp.mob.ae = dsp.mob.additionalEffect

local additionalEffects =
{
    [dsp.mob.ae.BLIND] =
    {
        chance = 25,
        ele = dsp.magic.ele.DARK,
        sub = dsp.subEffect.BLIND,
        msg = dsp.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff = dsp.effect.BLINDNESS,
        power = 20,
        duration = 30,
        minDuration = 1,
        maxDuration = 45,
    },
    [dsp.mob.ae.CURSE] =
    {
        chance = 20,
        ele = dsp.magic.ele.DARK,
        sub = dsp.subEffect.CURSE,
        msg = dsp.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff = dsp.effect.CURSE_I,
        power = 50,
        duration = 300,
        minDuration = 1,
        maxDuration = 300,
    },
    [dsp.mob.ae.ENAERO] =
    {
        ele = dsp.magic.ele.WIND,
        sub = dsp.subEffect.WIND_DAMAGE,
        msg = dsp.msg.basic.ADD_EFFECT_DMG,
        negMsg = dsp.msg.basic.ADD_EFFECT_HEAL,
        mod = dsp.mod.INT,
        bonusAbilityParams = {bonusmab = 0, includemab = false},
    },
    [dsp.mob.ae.ENBLIZZARD] =
    {
        ele = dsp.magic.ele.ICE,
        sub = dsp.subEffect.ICE_DAMAGE,
        msg = dsp.msg.basic.ADD_EFFECT_DMG,
        negMsg = dsp.msg.basic.ADD_EFFECT_HEAL,
        mod = dsp.mod.INT,
        bonusAbilityParams = {bonusmab = 0, includemab = false},
    },
    [dsp.mob.ae.ENDARK] =
    {
        ele = dsp.magic.ele.DARK,
        sub = dsp.subEffect.DARKNESS_DAMAGE,
        msg = dsp.msg.basic.ADD_EFFECT_DMG,
        negMsg = dsp.msg.basic.ADD_EFFECT_HEAL,
        mod = dsp.mod.INT,
        bonusAbilityParams = {bonusmab = 0, includemab = false},
    },
    [dsp.mob.ae.ENFIRE] =
    {
        ele = dsp.magic.ele.FIRE,
        sub = dsp.subEffect.FIRE_DAMAGE,
        msg = dsp.msg.basic.ADD_EFFECT_DMG,
        negMsg = dsp.msg.basic.ADD_EFFECT_HEAL,
        mod = dsp.mod.INT,
        bonusAbilityParams = {bonusmab = 0, includemab = false},
    },
    [dsp.mob.ae.ENLIGHT] =
    {
        ele = dsp.magic.ele.LIGHT,
        sub = dsp.subEffect.LIGHT_DAMAGE,
        msg = dsp.msg.basic.ADD_EFFECT_DMG,
        negMsg = dsp.msg.basic.ADD_EFFECT_HEAL,
        mod = dsp.mod.INT,
        bonusAbilityParams = {bonusmab = 0, includemab = false},
    },
    [dsp.mob.ae.ENSTONE] =
    {
        ele = dsp.magic.ele.EARTH,
        sub = dsp.subEffect.EARTH_DAMAGE,
        msg = dsp.msg.basic.ADD_EFFECT_DMG,
        negMsg = dsp.msg.basic.ADD_EFFECT_HEAL,
        mod = dsp.mod.INT,
        bonusAbilityParams = {bonusmab = 0, includemab = false},
    },
    [dsp.mob.ae.ENTHUNDER] =
    {
        ele = dsp.magic.ele.LIGHTNING,
        sub = dsp.subEffect.LIGHTNING_DAMAGE,
        msg = dsp.msg.basic.ADD_EFFECT_DMG,
        negMsg = dsp.msg.basic.ADD_EFFECT_HEAL,
        mod = dsp.mod.INT,
        bonusAbilityParams = {bonusmab = 0, includemab = false},
    },
    [dsp.mob.ae.ENWATER] =
    {
        ele = dsp.magic.ele.WATER,
        sub = dsp.subEffect.WATER_DAMAGE,
        msg = dsp.msg.basic.ADD_EFFECT_DMG,
        negMsg = dsp.msg.basic.ADD_EFFECT_HEAL,
        mod = dsp.mod.INT,
        bonusAbilityParams = {bonusmab = 0, includemab = false},
    },
    [dsp.mob.ae.EVA_DOWN] =
    {
        chance = 25,
        ele = dsp.magic.ele.ICE,
        sub = dsp.subEffect.EVASION_DOWN,
        msg = dsp.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff = dsp.effect.EVASION_DOWN,
        power = 25,
        duration = 30,
        minDuration = 1,
        maxDuration = 60,
    },
    [dsp.mob.ae.HP_DRAIN] =
    {
        chance = 10,
        ele = dsp.magic.ele.DARK,
        sub = dsp.subEffect.HP_DRAIN,
        msg = dsp.msg.basic.ADD_EFFECT_HP_DRAIN,
        mod = dsp.mod.INT,
        bonusAbilityParams = {bonusmab = 0, includemab = false},
        code = function(mob, target, power) mob:addHP(power) end,
    },
    [dsp.mob.ae.MP_DRAIN] =
    {
        chance = 10,
        ele = dsp.magic.ele.DARK,
        sub = dsp.subEffect.MP_DRAIN,
        msg = dsp.msg.basic.ADD_EFFECT_MP_DRAIN,
        mod = dsp.mod.INT,
        bonusAbilityParams = {bonusmab = 0, includemab = false},
        code = function(mob, target, power) local mp = math.min(power, target:getMP()); target:delMP(mp); mob:addMP(mp) end,
    },
    [dsp.mob.ae.PARALYZE] =
    {
        chance = 25,
        ele = dsp.magic.ele.ICE,
        sub = dsp.subEffect.PARALYSIS,
        msg = dsp.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff = dsp.effect.PARALYSIS,
        power = 20,
        duration = 30,
        minDuration = 1,
        maxDuration = 60,
    },
    [dsp.mob.ae.PETRIFY] =
    {
        chance = 20,
        ele = dsp.magic.ele.EARTH,
        sub = dsp.subEffect.PETRIFY,
        msg = dsp.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff = dsp.effect.PETRIFICATION,
        power = 1,
        duration = 30,
        minDuration = 1,
        maxDuration = 45,
    },
    [dsp.mob.ae.PLAGUE] =
    {
        chance = 25,
        ele = dsp.magic.ele.WATER,
        sub = dsp.subEffect.PLAGUE,
        msg = dsp.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff = dsp.effect.PLAGUE,
        power = 1,
        duration = 60,
        minDuration = 1,
        maxDuration = 60,
    },
    [dsp.mob.ae.POISON] =
    {
        chance = 25,
        ele = dsp.magic.ele.WATER,
        sub = dsp.subEffect.POISON,
        msg = dsp.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff = dsp.effect.POISON,
        power = 1,
        duration = 30,
        minDuration = 1,
        maxDuration = 30,
        tick = 3,
    },
    [dsp.mob.ae.SILENCE] =
    {
        chance = 25,
        ele = dsp.magic.ele.WIND,
        sub = dsp.subEffect.SILENCE,
        msg = dsp.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff = dsp.effect.SILENCE,
        power = 1,
        duration = 30,
        minDuration = 1,
        maxDuration = 30,
    },
    [dsp.mob.ae.SLOW] =
    {
        chance = 25,
        ele = dsp.magic.ele.EARTH,
        sub = dsp.subEffect.DEFENSE_DOWN,
        msg = dsp.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff = dsp.effect.SLOW,
        power = 1000,
        duration = 30,
        minDuration = 1,
        maxDuration = 45,
    },
    [dsp.mob.ae.STUN] =
    {
        chance = 20,
        ele = dsp.magic.ele.LIGHTNING,
        sub = dsp.subEffect.STUN,
        msg = dsp.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff = dsp.effect.STUN,
        duration = 5,
    },
    [dsp.mob.ae.TERROR] =
    {
        chance = 20,
        sub = dsp.subEffect.PARALYSIS,
        msg = dsp.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff = dsp.effect.TERROR,
        duration = 5,
        code = function(mob, target, power) mob:resetEnmity(target) end,
    },
    [dsp.mob.ae.TP_DRAIN] =
    {
        chance = 25,
        ele = dsp.magic.ele.DARK,
        sub = dsp.subEffect.TP_DRAIN,
        msg = dsp.msg.basic.ADD_EFFECT_TP_DRAIN,
        mod = dsp.mod.INT,
        bonusAbilityParams = {bonusmab = 0, includemab = false},
        code = function(mob, target, power) local tp = math.min(power, target:getTP()); target:delTP(tp); mob:addTP(tp) end,
    },
}

--[[
    mob, target, and damage are passed from core into mob script's onAdditionalEffect
    effect should be of type dsp.mob.additionalEffect (see above)
    params is a table that can contain any of:
        chance: percent chance that effect procs on hit (default 20)
        power: power of effect
        duration: duration of effect, in seconds
        code: additional code that will run when effect procs, of form function(mob, target, power)
    params will override effect's default settings
--]]
dsp.mob.onAddEffect = function(mob, target, damage, effect, params)
    if type(params) ~= "table" then params = {} end

    local ae = additionalEffects[effect]

    if ae then
        local chance = params.chance or ae.chance or 100
        local dLevel = target:getMainLvl() - mob:getMainLvl()

        if dLevel > 0 then
            chance = chance - 5 * dLevel
            chance = utils.clamp(chance, 5, 95)
        end

        -- target:PrintToPlayer(string.format("Chance: %i", chance)) -- DEBUG

        if math.random(100) <= chance then

            -- STATUS EFFECT
            if ae.applyEffect then
                local resist = 1
                if ae.ele then
                    resist = applyResistanceAddEffect(mob, target, ae.ele, ae.eff)
                end

                if resist > 0.5 and not target:hasStatusEffect(ae.eff) then
                    local power = params.power or ae.power or 0
                    local tick = ae.tick or 0
                    local duration = params.duration or ae.duration

                    if dLevel < 0 then
                        duration = duration - dLevel
                    end

                    if ae.minDuration and duration < ae.minDuration then
                        duration = ae.minDuration
                    elseif ae.maxDuration and duration > ae.maxDuration then
                        duration = ae.maxDuration
                    end

                    duration = duration * resist

                    target:addStatusEffect(ae.eff, power, tick, duration)

                    if params.code then
                        params.code(mob, target, power)
                    elseif ae.code then
                        ae.code(mob, target, power)
                    end

                    return ae.sub, ae.msg, ae.eff
                end

            -- IMMEDIATE EFFECT
            else
                local power = 0

                if params.power then
                    power = params.power
                elseif ae.mod then
                    local dMod = mob:getStat(ae.mod) - target:getStat(ae.mod)

                    if dMod > 20 then
                        dMod = 20 + (dMod - 20) / 2
                    end

                    power = dMod + target:getMainLvl() - mob:getMainLvl() + damage / 2
                end

                -- target:PrintToPlayer(string.format("Initial Power: %f", power)) -- DEBUG

                power = addBonusesAbility(mob, ae.ele, target, power, ae.bonusAbilityParams)
                power = power * applyResistanceAddEffect(mob, target, ae.ele, 0)
                power = adjustForTarget(target, power, ae.ele)
                power = finalMagicNonSpellAdjustments(mob, target, ae.ele, power)

                -- target:PrintToPlayer(string.format("Adjusted Power: %f", power)) -- DEBUG

                local message = ae.msg
                if power < 0 then
                    if ae.negMsg then
                        message = ae.negMsg
                    else
                        power = 0
                    end
                end

                if power ~= 0 then
                    if params.code then
                        params.code(mob, target, power)
                    elseif ae.code then
                        ae.code(mob, target, power)
                    end

                    return ae.sub, message, power
                end
            end
        end
    else
        printf("invalid additional effect for mobId %i", mob:getID())
    end

    return 0, 0, 0
end