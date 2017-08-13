---------------------------------------------------
-- String Shredder
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
        atkmulti = 1.36,
        weaponType = SKILL_SWD,
        ftp100 = 1.5,
        ftp200 = 1.5,
        ftp300 = 1.5,
        acc100 = 0.0,
        acc200 = 0.0,
        acc300 = 0.0,
        canCrit = true,
        crit100 = 0.2,
        crit200 = 0.4,
        crit300 = 0.7,
        str_wsc = 0.0,
        dex_wsc = 0.0,
        vit_wsc = 0.5,
        agi_wsc = 0.0,
        int_wsc = 0.0,
        mnd_wsc = 0.0,
        chr_wsc = 0.0
    }
    skill:setSkillchain(29)

    local damage = doAutoPhysicalWeaponskill(automaton, target, 0, tp, true, action, false, params, skill)

    return damage
end
