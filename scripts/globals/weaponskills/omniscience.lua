-----------------------------------
-- Omniscience
-- Staff weapon skill
-- Skill Level: N/A
-- Lowers target's magic attack. Duration of effect varies with TP. Tupsimati: Aftermath effect varies with TP.
-- Reduces enemy's magic attack by -10.
-- Available only after completing the Unlocking a Myth (Scholar) quest.
-- Aligned with the Shadow Gorget, Soil Gorget & Light Gorget.
-- Aligned with the Shadow Belt, Soil Belt & Light Belt.
-- Element: Dark
-- Modifiers: MND:80%
-- 100%TP    200%TP    300%TP
-- 2.00      2.00      2.00
-----------------------------------
require("scripts/globals/aftermath")
require("scripts/globals/magic")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.ftp100 = 2 params.ftp200 = 2 params.ftp300 = 2
    params.str_wsc = 0.0 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0
    params.mnd_wsc = 0.3 params.chr_wsc = 0.0
    params.ele = dsp.magic.ele.DARK
    params.skill = dsp.skill.STAFF
    params.includemab = true

    if USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.mnd_wsc = 0.8
    end

    local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, params, tp, action, primary)

    if damage > 0 then
        if not target:hasStatusEffect(dsp.effect.MAGIC_ATK_DOWN) then
            local duration = tp / 1000 * 60
            target:addStatusEffect(dsp.effect.MAGIC_ATK_DOWN, 10, 0, duration)
        end

        -- Apply Aftermath
        dsp.aftermath.addStatusEffect(player, tp, dsp.slot.MAIN, dsp.aftermath.type.MYTHIC)
    end

    return tpHits, extraHits, criticalHit, damage
end
