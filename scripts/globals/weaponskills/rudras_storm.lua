-----------------------------------
-- Rudra's Storm
-- Dagger weapon skill
-- Skill level: N/A
-- Deals triple damage and weighs target down (duration: 60s). Damage varies with TP.
-- Aligned with the Aqua Gorget, Snow Gorget & Shadow Gorget.
-- Aligned with the Aqua Belt, Snow Belt & Shadow Belt.
-- Element: None
-- Modifiers: DEX:80%
-- 100%TP    200%TP    300%TP
-- 6          15        19.5
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary)

    local params = {};
    params.numHits = 1;
    params.ftp100 = 3.25; params.ftp200 = 4.25; params.ftp300 = 5.25;
    params.str_wsc = 0.0; params.dex_wsc = 0.6; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp100 = 5; params.ftp200 = 10.19; params.ftp300 = 13;
        params.dex_wsc = 0.8;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, primary);

    -- EFFECT_WEIGHT power value is equal to lead breath as per bg-wiki: http://www.bg-wiki.com/bg/Rudra%27s_Storm

    if (damage > 0 and target:hasStatusEffect(EFFECT_WEIGHT) == false) then
        target:addStatusEffect(EFFECT_WEIGHT, 50, 0, 60);
    end
    return tpHits, extraHits, criticalHit, damage;

end