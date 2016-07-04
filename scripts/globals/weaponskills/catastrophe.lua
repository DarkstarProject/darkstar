-----------------------------------
-- Catastrophe
-- Scythe weapon skill
-- Skill Level: N/A
-- Drain target's HP. Bec de Faucon/Apocalypse: Additional effect: Haste
-- This weapon skill is available with the stage 5 relic Scythe Apocalypse or within Dynamis with the stage 4 Bec de Faucon.
-- Also available without Aftermath effects with the Crisis Scythe. After 13 weapon skills have been used successfully, gives one "charge" of Catastrophe.
-- Aligned with the Shadow Gorget & Soil Gorget.
-- Aligned with the Shadow Belt & Soil Belt.
-- Element: None
-- Modifiers: INT:40% ; AGI:40%
-- 100%TP    200%TP    300%TP
-- 2.75      2.75      2.75
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary)

    local params = {};
    params.numHits = 1;
    params.ftp100 = 2.75; params.ftp200 = 2.75; params.ftp300 = 2.75;
    params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.4; params.int_wsc = 0.4; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 0.4; params.agi_wsc = 0.0; params.int_wsc = 0.4;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, primary);
    -- TODO: Whoever codes those level 85 weapons with the latent that grants this WS needs to code a check to not give the aftermath effect.
    if (damage > 0) then
        local amDuration = 20 * math.floor(tp/1000);
        player:addStatusEffect(EFFECT_AFTERMATH, 100, 0, amDuration, 0, 6);
    end

    if (target:isUndead() == false) then
        local drain = (damage * 0.4);
        player:addHP(drain);
    end
    return tpHits, extraHits, criticalHit, damage;
end