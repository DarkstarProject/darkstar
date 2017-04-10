---------------------------------------------------
-- Bone Crusher
---------------------------------------------------

require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/automatonweaponskills")

---------------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    local master = automaton:getMaster()
    local effects = master:countEffect(EFFECT_LIGHT_MANEUVER)
    if effects > 0 then
        return effects
    else
        return -1
    end
end

function onAutomatonAbility(automaton, target, skill, tp, master, action)
    local params = {
        numHits = 3,
        atkmulti = 1,
        weaponType = SKILL_CLB,
        ftp100 = 1.5,
        ftp200 = 1.5,
        ftp300 = 1.5,
        acc100 = 0.0,
        acc200 = 0.0,
        acc300 = 0.0,
        str_wsc = 0.0,
        dex_wsc = 0.0,
        vit_wsc = 0.6,
        agi_wsc = 0.0,
        int_wsc = 0.0,
        mnd_wsc = 0.0,
        chr_wsc = 0.0
    }
    skill:setSkillchain(24)

    if USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftp100 = 2.66
        params.ftp200 = 2.66
        params.ftp300 = 2.66

        if target:isUndead() then
            params.ftp100 = 3.66
            params.ftp200 = 3.66
            params.ftp300 = 3.66
        end
    else
        if target:isUndead() then
            params.ftp100 = 2.0
            params.ftp200 = 2.0
            params.ftp300 = 2.0
        end
    end
    

    local damage = doAutoPhysicalWeaponskill(automaton, target, 0, tp, true, action, false, params, skill)

    if damage > 0 then
        local chance = 0.033 * tp
        if not target:hasStatusEffect(EFFECT_STUN) and chance >= math.random()*100 then
            target:addStatusEffect(EFFECT_STUN, 1, 0, 4)
        end
    end

    return damage
end
