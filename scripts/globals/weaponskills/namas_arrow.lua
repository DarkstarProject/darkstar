-----------------------------------
-- Skill Level: N/A
-- Description: Additional Effect: Temporarily improves Ranged Accuracy
-- Aligned with the Light Gorget, Snow Gorget & Aqua Gorget.
-- Properties
-- Element: N/A
-- Skillchain Properties: Light/Distortion
-- Modifiers: STR: 40% AGI: 40%
-- Damage Multipliers by TP:
-- 100%TP    200%TP    300%TP
--   2.75    2.75    2.75
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary)

    local params = {};
    params.numHits = 1;
    params.ftp100 = 2.75; params.ftp200 = 2.75; params.ftp300 = 2.75;
    params.str_wsc = 0.4; params.dex_wsc = 0.0; params.vit_wsc = 0.0;
    params.agi_wsc = 0.4; params.int_wsc = 0.0; params.mnd_wsc = 0.0;
    params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;
    params.overrideCE = 160;
    params.overrideVE = 480;

    local damage, criticalHit, tpHits, extraHits = doRangedWeaponskill(player, target, wsID, params, tp, primary);
    -- TODO: Whoever codes those level 85 weapons with the latent that grants this WS needs to code a check to not give the aftermath effect.
    if (damage > 0) then
        local amDuration = 20 * math.floor(tp/1000);
        player:addStatusEffect(EFFECT_AFTERMATH, 20, 0, amDuration, 0, 12);
    end

    return tpHits, extraHits, criticalHit, damage;
end;
