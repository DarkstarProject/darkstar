-----------------------------------
-- Geirskogul
-- Polearm weapon skill
-- Skill Level: N/A
-- Gae Assail/Gungnir: Shock Spikes.
-- This weapon skill is only available with the stage 5 relic Polearm Gungnir, within Dynamis with the stage 4 Gae Assail, or by activating the latent effect on the Skogul Lance.
-- Aligned with the Light Gorget, Aqua Gorget & Snow Gorget.
-- Aligned with the Light Belt, Aqua Belt & Snow Belt.
-- Element: None
-- Modifiers: AGI:60%
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
    params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.6; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.dex_wsc = 0.8; params.agi_wsc = 0.0;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, primary);
    -- TODO: Whoever codes those level 85 weapons with the latent that grants this WS needs to code a check to not give the aftermath effect.
    if (damage > 0) then
        local amDuration = 20 * math.floor(tp/1000);
        player:addStatusEffect(EFFECT_AFTERMATH, 6, 0, amDuration, 0, 7);
    end

    return tpHits, extraHits, criticalHit, damage;
end