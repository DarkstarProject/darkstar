---------------------------------------------------
-- Armor Shatterer
---------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/automatonweaponskills")

---------------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    local master = automaton:getMaster()
    return master:countEffect(dsp.effects.WIND_MANEUVER)
end

function onPetAbility(target, automaton, skill, master, action)
    local params = {
        numHits = 2,
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

    local damage = doAutoRangedWeaponskill(automaton, target, 0, params, skill:getTP(), true, skill, action)

    if damage > 0 then
        local bonusduration = 1 + 0.00033 * (skill:getTP() - 1000)
        if not target:hasStatusEffect(dsp.effects.DEFENSE_DOWN) then
            target:addStatusEffect(dsp.effects.DEFENSE_DOWN, 15, 0, 90*bonusduration)
        end
    end

    return damage
end
