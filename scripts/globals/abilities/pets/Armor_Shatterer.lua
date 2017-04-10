---------------------------------------------------
-- Armor Shatterer
---------------------------------------------------

require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/automatonweaponskills")

---------------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    local master = automaton:getMaster()
    local effects = master:countEffect(EFFECT_WIND_MANEUVER)
    if effects > 0 then
        return effects
    else
        return -1
    end
end

function onAutomatonAbility(automaton, target, skill, tp, master, action)
    local params = {
        numHits = 4,
        atkmulti = 2.25,
        accBonus = 50,
        ftp100 = 6.0,
        ftp200 = 6.0,
        ftp300 = 6.0,
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
    skill:setSkillchain(141)

    local damage = doAutoRangedWeaponskill(automaton, target, 0, params, tp, true, skill)

    if damage > 0 then
        local bonusduration = 1 + 0.00033 * (tp - 1000)
        if not target:hasStatusEffect(EFFECT_DEFENSE_DOWN) then
            target:addStatusEffect(EFFECT_DEFENSE_DOWN, 15, 0, 90*bonusduration)
        end
    end

    return damage
end
