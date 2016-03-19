-----------------------------------
-- Exenterator
-- Skill level: 357
-- Terpsichore: Aftermath effect varies with TP.
-- In order to obtain Exenterator, the quest Martial Mastery must be completed.
-- Description: Delivers a fourfold attack that lowers enemy's params.accuracy. Effect duration varies with TP.
-- Aligned with the Breeze Gorget, Thunder Gorget & Soil Gorget.
-- Aligned with the Breeze Belt, Thunder Belt & Soil Belt.
-- Notes: Stacks with itself allowing continuous params.acc down
-- params.acc down isn't the same as the spell Blind or sources which are the same as blind allowing both to stack
-- Element: None
-- Modifiers: AGI:73~85%, depending on merit points upgrades.
-- 100%TP    200%TP    300%TP
-- 1.0        1.0       1.0
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary)

    local params = {};
    params.numHits = 4;
    params.ftp100 = 1.0; params.ftp200 = 1.0; params.ftp300 = 1.0;
    params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.85 + (player:getMerit(MERIT_EXENTERATOR) / 100); params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1.0;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.agi_wsc = 0.7 + (player:getMerit(MERIT_EXENTERATOR) / 100);
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, primary);

    if (damage > 0) then
        local duration=(tp/1000*30)+90;
        if (target:hasStatusEffect(EFFECT_ACCURACY_DOWN) == false) then
            target:addStatusEffect(EFFECT_ACCURACY_DOWN, 20, 0,duration);
        end
    end
    return tpHits, extraHits, criticalHit, damage;
end
