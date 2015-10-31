-----------------------------------
-- Sidewinder
-- Archery weapon skill
-- Skill level: 175
-- Delivers an inparams.accurate attack that deals quintuple damage. params.accuracy varies with TP.
-- Aligned with the Aqua Gorget, Light Gorget & Breeze Gorget.
-- Aligned with the Aqua Belt, Light Belt & Breeze Belt.
-- Element: None
-- Modifiers: STR:20% ; AGI:50%
-- 100%TP    200%TP    300%TP
-- 5.00      5.00      5.00
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID)

    local params = {};
    params.numHits = 1;
    params.ftp100 = 5; params.ftp200 = 5; params.ftp300 = 5;
    params.str_wsc = 0.16; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.25; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    -- "Has a substantial Ranged Accuracy penalty at 100TP." https://www.bg-wiki.com/bg/Sidewinder
    params.acc100 = 0.5; params.acc200= 0.75; params.acc300= 1;
    params.atkmulti = 1;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 0.2; params.agi_wsc = 0.5;
    end

    local damage, tpHits, extraHits = doRangedWeaponskill(player, target, params);
    damage = damage * WEAPON_SKILL_POWER
    return tpHits, extraHits, criticalHit, damage;

end
