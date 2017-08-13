---------------------------------------------------
-- String Clipper
---------------------------------------------------

require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/automatonweaponskills")

---------------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    local master = automaton:getMaster()
    local effects = master:countEffect(EFFECT_THUNDER_MANEUVER)
    if effects > 0 then
        return effects
    else
        return -1
    end
end

function onAutomatonAbility(automaton, target, skill, tp, master, action)
    local params = {
        numHits = 2,
        atkmulti = 1.25,
        weaponType = SKILL_SWD,
        ftp100 = 2.0,
        ftp200 = 2.0,
        ftp300 = 2.0,
        acc100 = 0.0,
        acc200 = 0.0,
        acc300 = 0.0,
        str_wsc = 0.3,
        dex_wsc = 0.3,
        vit_wsc = 0.0,
        agi_wsc = 0.0,
        int_wsc = 0.0,
        mnd_wsc = 0.0,
        chr_wsc = 0.0
    }
    skill:setSkillchain(129)

    if USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftp100 = 3.5
        params.ftp200 = 3.5
        params.ftp300 = 3.5
        params.accBonus = 0.05 * tp
    end

    local damage = doAutoPhysicalWeaponskill(automaton, target, 0, tp, true, action, false, params, skill)

    return damage
end
