-----------------------------------
-- Blade Yu
-- Katana weapon skill
-- Skill Level: 290
-- Delivers a water elemental attack. Additional effect Poison. Durration varies with TP.
-- Aligned with the Aqua Gorget & Soil Gorget.
-- Aligned with the Aqua Belt & Soil Belt.
-- Element: Water
-- Modifiers: DEX:50% ; INT:50%
-- 100%TP    200%TP    300%TP
-- 2.25      2.25      2.25
-----------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary)

    local params = {};
    params.ftp100 = 2.25; params.ftp200 = 2.25; params.ftp300 = 2.25;
    params.str_wsc = 0.0; params.dex_wsc = 0.5; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.5; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.ele = ELE_WATER;
    params.skill = SKILL_KAT;
    params.includemab = true;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp100 = 3; params.ftp200 = 3; params.ftp300 = 3;
        params.dex_wsc = 0.4; params.int_wsc = 0.4;
    end

    local damage, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, params, tp, primary);

    if (damage > 0) then
        local duration = (tp/1000 * 15) + 75;
        if (target:hasStatusEffect(EFFECT_POISON) == false) then
            target:addStatusEffect(EFFECT_POISON, 10, 0, duration);
        end
    end
    return tpHits, extraHits, criticalHit, damage;

end
