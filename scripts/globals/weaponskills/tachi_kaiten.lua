-----------------------------------
-- Tachi Kaiten
-- Great Katana weapon skill
-- Skill level: N/A
-- Additional effect: temporarily increases amount of TP stored with each hit.
-- Grants Store TP+7 for the duration of time that it is active. Length of time depends on TP.
-- 100 TP = 20s
-- 200 TP = 40s
-- 300 TP = 60s
-- This weapon skill is only available with the stage 5 relic Great Katana Amanomurakumo or within Dynamis with the stage 4 Totsukanotsurugi.
-- Also available as a Latent effect on Ame-no-ohabari
-- Aligned with the Breeze Gorget, Thunder Gorget & Light Gorget.
-- Aligned with the Breeze Belt, Thunder Belt & Light Belt.
-- Element: None
-- Modifiers: STR:75%
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
    params.str_wsc = 0.6; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 0.75;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, primary);
    -- TODO: Whoever codes those level 85 weapons with the latent that grants this WS needs to code a check to not give the aftermath effect.
    if (damage > 0) then
        local amDuration = 20 * math.floor(player:getTP()/100);
        player:addStatusEffect(EFFECT_AFTERMATH, 7, 0, amDuration, 0, 8);
    end

    return tpHits, extraHits, criticalHit, damage;
end