-----------------------------------
--  PET: Wyvern
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

local WYVERN_OFFENSIVE = 1
local WYVERN_DEFENSIVE = 2
local WYVERN_MULTI = 3

local wyvernTypes = {
    [dsp.job.WAR] = WYVERN_OFFENSIVE,
    [dsp.job.MNK] = WYVERN_OFFENSIVE,
    [dsp.job.WHM] = WYVERN_DEFENSIVE,
    [dsp.job.BLM] = WYVERN_DEFENSIVE,
    [dsp.job.RDM] = WYVERN_DEFENSIVE,
    [dsp.job.THF] = WYVERN_OFFENSIVE,
    [dsp.job.PLD] = WYVERN_MULTI,
    [dsp.job.DRK] = WYVERN_MULTI,
    [dsp.job.BST] = WYVERN_OFFENSIVE,
    [dsp.job.BRD] = WYVERN_MULTI,
    [dsp.job.RNG] = WYVERN_OFFENSIVE,
    [dsp.job.SAM] = WYVERN_OFFENSIVE,
    [dsp.job.NIN] = WYVERN_MULTI,
    [dsp.job.DRG] = WYVERN_OFFENSIVE,
    [dsp.job.SMN] = WYVERN_DEFENSIVE,
    [dsp.job.BLU] = WYVERN_DEFENSIVE,
    [dsp.job.COR] = WYVERN_OFFENSIVE,
    [dsp.job.PUP] = WYVERN_OFFENSIVE,
    [dsp.job.DNC] = WYVERN_OFFENSIVE,
    [dsp.job.SCH] = WYVERN_DEFENSIVE,
    [dsp.job.GEO] = WYVERN_DEFENSIVE,
    [dsp.job.RUN] = WYVERN_MULTI
}

-- It seems that the logic is:
-- JOB ABILITIES
    -- Includes physical job abilities with a duration, e.g. Berserk, Seigan, Meditate
        -- i.e. Probably should include Cover
    -- Excludes magical job abilities with a duration, e.g. Dark Arts, Light Arts
        -- i.e. Probably should exclude Composure
    -- Excludes on hit job abilities, e.g. Sneak Attack, Elemental Seal; EXCEPTION: Boost
        -- i.e. Probably should exclude Barrage
-- SPELLS
    -- Includes battle spell buffs, e.g. stoneskin, spikes, regen, utsusemi, samba, minuet, rolls, sambas
        -- i.e. Probably should include Migawari, Avatar's Favor
    -- Excludes non-battle spell buffs, e.g. Monomi, Invisible
        -- i.e. Probably should exclude Mazurka, Jigs
-- CONSUMABLES
    -- Includes attribute boosting medicines, e.g. Icarus Wing, Agility Potion, Giant's Drink
    -- Excludes food, i.e. Instant Noodles, Meat Mithkabob
local empathyEffects = {

        -- JOB ABILITIES
        [dsp.effect.BOOST] = true,
        [dsp.effect.BERSERK] = true,
        [dsp.effect.HOLY_CIRCLE] = true,
        [dsp.effect.ARCANE_CIRCLE] = true,
        [dsp.effect.WARDING_CIRCLE] = true,
        [dsp.effect.ANCIENT_CIRCLE] = true,
        [dsp.effect.DODGE] = true,
        [dsp.effect.FLEE] = true,
        [dsp.effect.FOCUS] = true,
        [dsp.effect.HASSO] = true,
        [dsp.effect.INTENSION] = true,
        [dsp.effect.LAST_RESORT] = true,
        [dsp.effect.PHYSICAL_SHIELD] = true,
        [dsp.effect.ARROW_SHIELD] = true,
        [dsp.effect.MAGIC_SHIELD] = true,
        [dsp.effect.PAX] = true,
        [dsp.effect.POTENCY] = true,
        [dsp.effect.PROTECT] = true,
        [dsp.effect.QUICKENING] = true,
        [dsp.effect.REGAIN] = true,
        [dsp.effect.DRAIN_SAMBA] = true,
        [dsp.effect.ASPIR_SAMBA] = true,
        [dsp.effect.HASTE_SAMBA] = true,
        [dsp.effect.SEIGAN] = true,
        [dsp.effect.SOULEATER] = true,
        [dsp.effect.SUBLIMATION_ACTIVATED] = true,
        [dsp.effect.SUBLIMATION_COMPLETE] = true,
        [dsp.effect.THIRD_EYE] = true,
        [dsp.effect.WARCRY] = true,

        -- SPELLS
        [dsp.effect.AQUAVEIL] = true,
        [dsp.effect.BARFIRE] = true,
        [dsp.effect.BARBLIZZARD] = true,
        [dsp.effect.BARAERO] = true,
        [dsp.effect.BARSTONE] = true,
        [dsp.effect.BARTHUNDER] = true,
        [dsp.effect.BARWATER] = true,
        [dsp.effect.BARSLEEP] = true,
        [dsp.effect.BARPOISON] = true,
        [dsp.effect.BARPARALYZE] = true,
        [dsp.effect.BARBLIND] = true,
        [dsp.effect.BARSILENCE] = true,
        [dsp.effect.BARPETRIFY] = true,
        [dsp.effect.BARVIRUS] = true,
        [dsp.effect.BARAMNESIA] = true,
        [dsp.effect.BLINK] = true,
        [dsp.effect.BLAZE_SPIKES] = true,
        [dsp.effect.ICE_SPIKES] = true,
        [dsp.effect.SHOCK_SPIKES] = true,
        [dsp.effect.DAMAGE_SPIKES] = true,
        [dsp.effect.DREAD_SPIKES] = true,
        [dsp.effect.DELUGE_SPIKES] = true,
        [dsp.effect.GALE_SPIKES] = true,
        [dsp.effect.CLOD_SPIKES] = true,
        [dsp.effect.GLINT_SPIKES] = true,
        [dsp.effect.ENFIRE] = true,
        [dsp.effect.ENBLIZZARD] = true,
        [dsp.effect.ENAERO] = true,
        [dsp.effect.ENSTONE] = true,
        [dsp.effect.ENTHUNDER] = true,
        [dsp.effect.ENWATER] = true,
        [dsp.effect.ENCHANTMENT] = true,
        [dsp.effect.ENLIGHT] = true,
        [dsp.effect.ENFIRE_II] = true,
        [dsp.effect.ENBLIZZARD_II] = true,
        [dsp.effect.ENAERO_II] = true,
        [dsp.effect.ENSTONE_II] = true,
        [dsp.effect.ENTHUNDER_II] = true,
        [dsp.effect.ENWATER_II] = true,
        [dsp.effect.ENDARK] = true,
        [dsp.effect.HASTE] = true,
        [dsp.effect.REFRESH] = true,
        [dsp.effect.REGEN] = true,
        [dsp.effect.RERAISE] = true,
        [dsp.effect.SHELL] = true,
        [dsp.effect.SHINING_RUBY] = true,
        [dsp.effect.COPY_IMAGE] = true,
        [dsp.effect.COPY_IMAGE_1] = true,
        [dsp.effect.COPY_IMAGE_2] = true,
        [dsp.effect.COPY_IMAGE_3] = true,
        [dsp.effect.COPY_IMAGE_4] = true,
        [dsp.effect.STONESKIN] = true,
        [dsp.effect.FIGHTERS_ROLL] = true,
        [dsp.effect.MONKS_ROLL] = true,
        [dsp.effect.HEALERS_ROLL] = true,
        [dsp.effect.WIZARDS_ROLL] = true,
        [dsp.effect.WARLOCKS_ROLL] = true,
        [dsp.effect.ROGUES_ROLL] = true,
        [dsp.effect.GALLANTS_ROLL] = true,
        [dsp.effect.CHAOS_ROLL] = true,
        [dsp.effect.BEAST_ROLL] = true,
        [dsp.effect.CHORAL_ROLL] = true,
        [dsp.effect.HUNTERS_ROLL] = true,
        [dsp.effect.SAMURAI_ROLL] = true,
        [dsp.effect.NINJA_ROLL] = true,
        [dsp.effect.DRACHEN_ROLL] = true,
        [dsp.effect.EVOKERS_ROLL] = true,
        [dsp.effect.MAGUSS_ROLL] = true,
        [dsp.effect.CORSAIRS_ROLL] = true,
        [dsp.effect.PUPPET_ROLL] = true,
        [dsp.effect.DANCERS_ROLL] = true,
        [dsp.effect.SCHOLARS_ROLL] = true,
        [dsp.effect.BOLTERS_ROLL] = true,
        [dsp.effect.CASTERS_ROLL] = true,
        [dsp.effect.COURSERS_ROLL] = true,
        [dsp.effect.BLITZERS_ROLL] = true,
        [dsp.effect.TACTICIANS_ROLL] = true,
        [dsp.effect.ALLIES_ROLL] = true,
        [dsp.effect.MISERS_ROLL] = true,
        [dsp.effect.COMPANIONS_ROLL] = true,
        [dsp.effect.AVENGERS_ROLL] = true,
        [dsp.effect.NATURALISTS_ROLL] = true,
        [dsp.effect.RUNEISTS_ROLL] = true,
        [dsp.effect.CARBUNCLES_FAVOR] = true,
        [dsp.effect.IFRITS_FAVOR] = true,
        [dsp.effect.SHIVAS_FAVOR] = true,
        [dsp.effect.GARUDAS_FAVOR] = true,
        [dsp.effect.TITANS_FAVOR] = true,
        [dsp.effect.RAMUHS_FAVOR] = true,
        [dsp.effect.LEVIATHANS_FAVOR] = true,
        [dsp.effect.FENRIRS_FAVOR] = true,
        [dsp.effect.DIABOLOSS_FAVOR] = true,
        [dsp.effect.AVATARS_FAVOR] = true,
        [dsp.effect.CAIT_SITH_S_FAVOR] = true,
        [dsp.effect.PAEON] = true,
        [dsp.effect.BALLAD] = true,
        [dsp.effect.MINNE] = true,
        [dsp.effect.MINUET] = true,
        [dsp.effect.MADRIGAL] = true,
        [dsp.effect.PRELUDE] = true,
        [dsp.effect.MAMBO] = true,
        [dsp.effect.AUBADE] = true,
        [dsp.effect.PASTORAL] = true,
        -- [dsp.effect.HUM] = true,
        [dsp.effect.FANTASIA] = true,
        [dsp.effect.OPERETTA] = true,
        [dsp.effect.CAPRICCIO] = true,
        [dsp.effect.SERENADE] = true,
        [dsp.effect.ROUND] = true,
        [dsp.effect.GAVOTTE] = true,
        -- [dsp.effect.FUGUE] = true,
        -- [dsp.effect.RHAPSODY] = true,
        -- [dsp.effect.ARIA] = true,
        [dsp.effect.MARCH] = true,
        [dsp.effect.ETUDE] = true,
        [dsp.effect.CAROL] = true,
        [dsp.effect.HYMNUS] = true,
        [dsp.effect.SIRVENTE] = true,
        [dsp.effect.DIRGE] = true,
        [dsp.effect.SCHERZO] = true,

        -- ATTRIBUTES
        [dsp.effect.STR_BOOST] = true,
        [dsp.effect.DEX_BOOST] = true,
        [dsp.effect.VIT_BOOST] = true,
        [dsp.effect.AGI_BOOST] = true,
        [dsp.effect.INT_BOOST] = true,
        [dsp.effect.MND_BOOST] = true,
        [dsp.effect.CHR_BOOST] = true,
        [dsp.effect.MAX_HP_BOOST] = true,
        [dsp.effect.MAX_MP_BOOST] = true,
        [dsp.effect.ACCURACY_BOOST] = true,
        [dsp.effect.ATTACK_BOOST] = true,
        [dsp.effect.EVASION_BOOST] = true,
        [dsp.effect.DEFENSE_BOOST] = true,
        [dsp.effect.STR_BOOST_2] = true,
        [dsp.effect.DEX_BOOST_2] = true,
        [dsp.effect.VIT_BOOST_2] = true,
        [dsp.effect.AGI_BOOST_2] = true,
        [dsp.effect.INT_BOOST_2] = true,
        [dsp.effect.MND_BOOST_2] = true,
        [dsp.effect.CHR_BOOST_2] = true,
        [dsp.effect.MAGIC_ATK_BOOST] = true,
        [dsp.effect.MAGIC_DEF_BOOST] = true,
        [dsp.effect.ENMITY_BOOST] = true,
        [dsp.effect.COUNTER_BOOST] = true,
        [dsp.effect.STR_BOOST_III] = true,
        [dsp.effect.DEX_BOOST_III] = true,
        [dsp.effect.VIT_BOOST_III] = true,
        [dsp.effect.AGI_BOOST_III] = true,
        [dsp.effect.INT_BOOST_III] = true,
        [dsp.effect.MND_BOOST_III] = true,
        [dsp.effect.CHR_BOOST_III] = true,
        [dsp.effect.ATTACK_BOOST_II] = true,
        [dsp.effect.DEFENSE_BOOST_II] = true,
        [dsp.effect.MAGIC_ATK_BOOST_II] = true,
        [dsp.effect.MAGIC_DEF_BOOST_II] = true,
        [dsp.effect.ACCURACY_BOOST_II] = true,
        [dsp.effect.EVASION_BOOST_II] = true,
        [dsp.effect.MAGIC_ACC_BOOST_II] = true,
        [dsp.effect.MAGIC_EVASION_BOOST] = true,
        [dsp.effect.MAGIC_EVASION_BOOST_II] = true
    }

function doHealingBreath(player, threshold, breath)
    if player:getHPP() < threshold then
        player:getPet():useJobAbility(breath, player)
    else
        local party = player:getParty()
        for _,member in ipairs(party) do
            if member:getHPP() < threshold then
                player:getPet():useJobAbility(breath, member)
                break
            end
        end
    end
end

function addWyvernExp(wyvern, exp)
    local prev_exp = pet:getLocalVar("wyvern_exp")
    if prev_exp < 1000 then
    -- cap exp at 1000 to prevent wyvern leveling up many times from large exp awards
        local currentExp = exp
        if prev_exp + exp > 1000 then
            currentExp = 1000 - prev_exp
        end
        local diff = math.floor((prev_exp + currentExp)/200) - math.floor(prev_exp/200)
        if diff ~= 0 then
            -- wyvern levelled up (diff is the number of level ups)
            pet:addMod(dsp.mod.ACC,6*diff)
            pet:addMod(dsp.mod.HPP,6*diff)
            pet:addMod(dsp.mod.ATTP,5*diff)
            pet:setHP(pet:getMaxHP())
            player:messageBasic(dsp.msg.basic.STATUS_INCREASED, 0, 0, pet)
            master:addMod(dsp.mod.ATTP, 4 * diff)
            master:addMod(dsp.mod.DEFP, 4 * diff)
            master:addMod(dsp.mod.HASTE_ABILITY, 200 * diff)
        end
        pet:setLocalVar("wyvern_exp", prev_exp + exp)
        pet:setLocalVar("level_Ups", pet:getLocalVar("level_Ups") + diff)
    end
end

function canCopyEffectToWyvern(effect)
    return empathyEffects[effects.getType()] ~= nil
end

function copyEffectToWyvern(pet, effect)
    local type = effect.getType()
    local power = effect.getPower()
    local tick = effect.getTickTime()
    local duration = effect.getDuration()
    pet:addStatusEffect(type, power, tick, duration)
end

function onMobSpawn(mob)
    local master = mob:getMaster()
    mob:addMod(dsp.mod.DMG, -40)
    local wyvernType = wyvernTypes[master:getSubJob()]
    local healingbreath = 624
    if mob:getMainLvl() >= 80 then healingbreath = 623
    elseif mob:getMainLvl() >= 40 then healingbreath = 626
    elseif mob:getMainLvl() >= 20 then healingbreath = 625 end
    if wyvernType == WYVERN_DEFENSIVE then
        master:addListener("WEAPONSKILL_USE", "PET_WYVERN_WS", function(player, target, skillid)
            local party = player:getParty()
            for _,member in ipairs(party) do
                if member:hasStatusEffect(dsp.effect.POISON) then
                    player:getPet():useJobAbility(627, member)
                    break
                elseif member:hasStatusEffect(dsp.effect.BLINDNESS) and player:getPet():getMainLvl() > 20 then
                    player:getPet():useJobAbility(628, member)
                    break
                elseif member:hasStatusEffect(dsp.effect.PARALYSIS) and player:getPet():getMainLvl() > 40 then
                    player:getPet():useJobAbility(629, member)
                    break
                elseif (member:hasStatusEffect(dsp.effect.CURSE_I) or member:hasStatusEffect(dsp.effect.DOOM)) and player:getPet():getMainLvl() > 60 then
                    player:getPet():useJobAbility(637, member)
                    break
                elseif (member:hasStatusEffect(dsp.effect.DISEASE) or member:hasStatusEffect(dsp.effect.PLAGUE)) and player:getPet():getMainLvl() > 80 then
                    player:getPet():useJobAbility(638, member)
                    break
                end
            end
        end)
        if master:getSubJob() ~= dsp.job.SMN then
            master:addListener("MAGIC_USE", "PET_WYVERN_MAGIC", function(player, target, spell, action)
                -- check master first!
                local threshold = 33
                if player:getMod(dsp.mod.WYVERN_EFFECTIVE_BREATH) > 0 then
                    threshold = 50
                end
                doHealingBreath(player, threshold, healingbreath)
            end)
        end
    elseif wyvernType == WYVERN_OFFENSIVE or wyvernType == WYVERN_MULTI then
        master:addListener("WEAPONSKILL_USE", "PET_WYVERN_WS", function(player, target, skillid)
            local weaknessTargetChance = 75
            local breaths = {}
            if player:getMod(dsp.mod.WYVERN_EFFECTIVE_BREATH) > 0 then
                weaknessTargetChance = 100
            end
            if math.random(100) <= weaknessTargetChance then
                local weakness = 0
                for mod = 0, 5 do
                    if target:getMod(dsp.mod.FIREDEF + mod) < target:getMod(dsp.mod.FIREDEF + weakness) then
                        breaths = {}
                        table.insert(breaths, 630 + mod)
                    elseif target:getMod(dsp.mod.FIREDEF + mod) == target:getMod(dsp.mod.FIREDEF + weakness) then
                        table.insert(breaths, 630 + mod)
                    end
                end
            else
                breaths = {630, 631, 632, 633, 634, 635}
            end
            player:getPet():useJobAbility(breaths[math.random(#breaths)], target)
        end)
    end
    if wyvernType == WYVERN_MULTI then
        master:addListener("MAGIC_USE", "PET_WYVERN_MAGIC", function(player, target, spell, action)
            -- check master first!
            local threshold = 25
            if player:getMod(dsp.mod.WYVERN_EFFECTIVE_BREATH) > 0 then
                threshold = 33
            end
            doHealingBreath(player, threshold, healingbreath)
        end)
    end

    master:addListener("ATTACK", "PET_WYVERN_ENGAGE", function(player, target, action)
        local pet = player:getPet()
        if pet:getTarget() == nil or target:getID() ~= pet:getTarget():getID() then
            player:petAttack(target)
        end
    end)

    master:addListener("DISENGAGE", "PET_WYVERN_DISENGAGE", function(player)
        player:petRetreat()
    end)

    master:addListener("EXPERIENCE_POINTS", "PET_WYVERN_EXP", function(player, exp)
        local pet = player:getPet()
        addWyvernExp(pet, exp)
    end)
end

function onMobDeath(mob, player)
    local master = mob:getMaster()
    local numLvls = mob:getLocalVar("level_Ups")
    if numLvls ~= 0 then
        master:delMod(dsp.mod.ATTP, 4 * numLvls)
        master:delMod(dsp.mod.DEFP, 4 * numLvls)
        master:delMod(dsp.mod.HASTE_ABILITY, 200 * numLvls)
    end
    master:removeListener("PET_WYVERN_WS")
    master:removeListener("PET_WYVERN_MAGIC")
    master:removeListener("PET_WYVERN_ENGAGE")
    master:removeListener("PET_WYVERN_DISENGAGE")
    master:removeListener("PET_WYVERN_EXP")
end
