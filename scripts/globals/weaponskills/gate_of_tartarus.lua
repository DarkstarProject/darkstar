-----------------------------------
-- Gate Of Tartarus
-- Staff weapon skill
-- Skill Level: N/A
-- Lowers target's attack. Additional effect: Refresh
-- Refresh effect is 8mp/tick for 20 sec per 100 TP.
-- Available only when equipped with the Relic Weapons Thyrus (Dynamis use only) and Claustrum, or the Chthonic Staff once the Latent Effect has been activated.
-- These Relic Weapons are only available to Black Mages and Summoners. As such, only these jobs may use this Weapon Skill.
-- Aligned with the Aqua Gorget & Snow Gorget.
-- Aligned with the Aqua Belt & Snow Belt.
-- Element: None
-- Modifiers: CHR:60%
-- 100%TP    200%TP    300%TP
-- 3.00      3.00      3.00
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary)

    local params = {};
    params.numHits = 1;
    params.ftp100 = 3; params.ftp200 = 3; params.ftp300 = 3;
    params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.6;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.int_wsc = 0.8; params.chr_wsc = 0.0;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, primary);
    -- TODO: Whoever codes those level 85 weapons with the latent that grants this WS needs to code a check to not give the aftermath effect.
    if (damage > 0) then
        local amDuration = 20 * math.floor(tp/1000);
        player:addStatusEffect(EFFECT_AFTERMATH, 8, 0, amDuration, 0, 10);
        target:addStatusEffect(EFFECT_ATTACK_DOWN, 20, 0, 60);
    end

    return tpHits, extraHits, criticalHit, damage;
end