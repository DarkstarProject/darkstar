-----------------------------------
-- Dark Harvest
-- Scythe weapon skill
-- Skill Level: 30
-- Delivers a dark elemental attack. Damage varies with TP.
-- Aligned with the Aqua Gorget.
-- Aligned with the Aqua Belt.
-- Element: Dark
-- Modifiers: STR:20%  INT:20%
-- 100%TP    200%TP    300%TP
-- 1.00      2.00      2.50
-----------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.ftp100 = 1 params.ftp200 = 2 params.ftp300 = 2.5
    params.str_wsc = 0.2 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.2 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.ele = dsp.magic.ele.DARK
    params.skill = dsp.skill.SCYTHE
    params.includemab = true

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 0.4 params.int_wsc = 0.4
    end

    local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, tp, primary, action, params)
    return tpHits, extraHits, criticalHit, damage

end
