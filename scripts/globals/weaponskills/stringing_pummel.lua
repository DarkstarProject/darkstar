-----------------------------------
-- Stringing Pummel
-- Sword weapon skill
-- Skill Level: N/A
-- Delivers a sixfold attack. Damage varies with TP.  Kenkonken: Aftermath effect varies with TP.
-- Available only after completing the Unlocking a Myth (Puppetmaster) quest.
-- Aligned with the Shadow Gorget, Soil Gorget & Flame Gorget.
-- Aligned with the Shadow Belt, Soil Belt & Flame Belt.
-- Element: Darkness
-- Modifiers: STR:32% VIT:32%
-- 100%TP    200%TP    300%TP
--   1         1         1
-----------------------------------
require("scripts/globals/aftermath")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 6
    params.ftp100 = 1 params.ftp200 = 1 params.ftp300 = 1
    params.str_wsc = 0.32 params.dex_wsc = 0.0 params.vit_wsc = 0.32 params.agi_wsc = 0.0 params.int_wsc = 0.0
    params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.15 params.crit200 = 0.45 params.crit300 = 0.65
    params.canCrit = true
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1; params.atk200 = 1; params.atk300 = 1;

    if USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.crit100 = 0.15 params.crit200 = 0.3 params.crit300 = 0.45
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params)

    -- Apply Aftermath
    if damage > 0 then
        dsp.aftermath.addStatusEffect(player, tp, dsp.slot.MAIN, dsp.aftermath.type.MYTHIC)
    end

    return tpHits, extraHits, criticalHit, damage
end
