---------------------------------------------------
-- Bone Crusher
---------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/automatonweaponskills")

---------------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    local master = automaton:getMaster()
    return master:countEffect(dsp.effects.LIGHT_MANEUVER)
end

function onPetAbility(target, automaton, skill, master, action)
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
    

    local damage = doAutoPhysicalWeaponskill(automaton, target, 0, skill:getTP(), true, action, false, params, skill, action)

    if damage > 0 then
        local chance = 0.033 * skill:getTP()
        if not target:hasStatusEffect(dsp.effects.STUN) and chance >= math.random()*100 then
            target:addStatusEffect(dsp.effects.STUN, 1, 0, 4)
        end
    end

    return damage
end
