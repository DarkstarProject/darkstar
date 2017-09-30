---------------------------------------------------
-- Cannibal Blade
---------------------------------------------------
require("scripts/globals/automatonweaponskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg");
---------------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    local master = automaton:getMaster()
    return master:countEffect(EFFECT_DARK_MANEUVER)
end

function onPetAbility(target, automaton, skill, master, action)
    local params = {
        numHits = 1,
        atkmulti = 20.0,
        accBonus = 1000,
        weaponDamage = automaton:getSkillLevel(22),
        weaponType = SKILL_SWD,
        ftp100 = 0.25,
        ftp200 = 0.4,
        ftp300 = 0.6,
        acc100 = 0.0,
        acc200 = 0.0,
        acc300 = 0.0,
        ignoresDef = true,
        ignored100 = 0.5,
        ignored200 = 0.5,
        ignored300 = 0.5,
        str_wsc = 0.0,
        dex_wsc = 0.0,
        vit_wsc = 0.0,
        agi_wsc = 0.0,
        int_wsc = 0.0,
        mnd_wsc = 0.0,
        chr_wsc = 0.0
    }

    if USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.weaponDamage = nil
        params.mnd_wsc = 1.0
        params.ftp100 = 16.0
        params.ftp200 = 23.5
        params.ftp300 = 31.5
    end

    if automaton:checkDistance(target) > 7 then
        if params.weaponDamage then
            params.weaponDamage = params.weaponDamage/4
        else
            params.ftp100 = params.ftp100/4
            params.ftp200 = params.ftp200/4
            params.ftp300 = params.ftp300/4
        end
    end

    local damage = doAutoPhysicalWeaponskill(automaton, target, 0, skill:getTP(), true, action, false, params, skill, action)

    if damage > 0 then
        if not target:isUndead() then
            automaton:addHP(damage)
            skill:setMsg(msgBasic.DRAIN_HP)
        end
    end

    return damage
end
