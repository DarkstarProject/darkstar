-----------------------------------
-- Randgrith
-- Club weapon skill
-- Skill level: N/A
-- Lowers target's evasion. Gullintani/Mjollnir: Temporarily improves params.accuracy.
-- Available only when equipped with the Relic Weapons Gullintani (Dynamis use only), Mjollnir, or a Charged Molva Maul.
-- Aftermath: Adds +20 params.accuracy after the weapon skill is used, duration is determined by TP. Only available with Gullintani and Mjollnir.
-- 100% = 20 seconds, 200% = 40 seconds, 300% = 60 seconds.
-- This Relic Weapon is only available to White Mages; Scholars must use the Molva Maul to acquire this weapon skill.
-- Shield Break effect : Evasion -32
-- Aligned with the Breeze Gorget & Thunder Gorget.
-- Aligned with the Breeze Belt & Thunder Belt.
-- Element: None
-- Modifiers: STR:40% ; MND:40%
-- 100%TP    200%TP    300%TP
-- 2.75      2.75      2.75
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)

    local params = {};
    params.numHits = 1;
    params.ftp100 = 2.75; params.ftp200 = 2.75; params.ftp300 = 2.75;
    params.str_wsc = 0.4; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.4; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params);

    if (damage > 0 and target:hasStatusEffect(dsp.effects.EVASION_DOWN) == false) then
        local duration = (tp/1000 * 20) * applyResistanceAddEffect(player,target,ELE_ICE,0);
        target:addStatusEffect(dsp.effects.EVASION_DOWN, 32, 0, duration);
    end

    return tpHits, extraHits, criticalHit, damage;
end
