-----------------------------------
-- Pyrrhic Kleos
-- Dagger weapon skill
-- Skill level: N/A
-- Description: Delivers a fourfold attack that lowers target's evasion. Duration of effect varies with TP. Terpsichore: Aftermath effect varies with TP.
-- Available only after completing the Unlocking a Myth (Dancer) quest.
-- Aligned with the Soil Gorget, Aqua Gorget & Snow Gorget.
-- Aligned with the Soil Belt, Aqua Belt & Snow Belt.
-- Element: Unknown
-- Skillchain Properties: Distortion/Scission
-- Modifiers: STR:40% ; DEX:40%
-- Damage Multipliers by TP:
-- 100%TP    200%TP    300%TP
-- 1.5        1.5        1.5
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)

    local params = {};
    params.numHits = 4;
    params.ftp100 = 1.5; params.ftp200 = 1.5; params.ftp300 = 1.5;
    params.str_wsc = 0.2; params.dex_wsc = 0.3; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; 
    params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp100 = 1.75; params.ftp200 = 1.75; params.ftp300 = 1.75;
        params.str_wsc = 0.4; params.dex_wsc = 0.4;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params);

    if (damage > 0 and target:hasStatusEffect(dsp.effects.EVASION_DOWN) == false) then
        local duration = (tp/1000 * 60) * applyResistanceAddEffect(player,target,ELE_ICE,0);
        target:addStatusEffect(dsp.effects.EVASION_DOWN, 10, 0, duration);
    end

    return tpHits, extraHits, criticalHit, damage;
end
