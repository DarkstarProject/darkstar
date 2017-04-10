---------------------------------------------------
-- Arcuballista
---------------------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/automatonweaponskills");

---------------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    local master = automaton:getMaster()
    local effects = master:countEffect(EFFECT_FIRE_MANEUVER)
    if effects > 0 then
        return effects
    else
        return -1
    end
end

function onAutomatonAbility(automaton, target, skill, tp, master, action)
    local params = {
        numHits = 1,
        atkmulti = 1,
        accBonus = 100,
        ftp100 = 2.5,
        ftp200 = 3.0,
        ftp300 = 4.0,
        acc100 = 0.0,
        acc200 = 0.0,
        acc300 = 0.0,
        str_wsc = 0.0,
        dex_wsc = 0.5,
        vit_wsc = 0.0,
        agi_wsc = 0.0,
        int_wsc = 0.0,
        mnd_wsc = 0.0,
        chr_wsc = 0.0
    }
    skill:setSkillchain(192)

    if USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftp100 = 7.0
        params.ftp200 = 10.0
        params.ftp300 = 13.0
    end

    local damage = doAutoRangedWeaponskill(automaton, target, 0, params, tp, true, skill)

    return damage
end
