-----------------------------------
-- Blade Retsu
-- Katana weapon skill
-- Skill Level: 30
-- Delivers a two-hit attack. Paralyzes enemy. Duration of paralysis varies with TP.
-- Proc rate of Paralyze seems to be based on your level in comparison to the targets level. The higher level you are compared to your target, it will be Paralyzed more often.
-- Will stack with Sneak Attack.
-- Aligned with the Soil Gorget.
-- Aligned with the Soil Belt.
-- Element: None
-- Modifiers: STR:20% ; DEX:20%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary)

    local params = {};
    params.numHits = 2;
    params.ftp100 = 1; params.ftp200 = 1; params.ftp300 = 1;
    params.str_wsc = 0.2; params.dex_wsc = 0.2; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.dex_wsc = 0.6;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, primary);
    if (damage > 0) then
        local duration = (tp/1000 * 30);
        if (target:hasStatusEffect(EFFECT_PARALYSIS) == false) then
            -- paralyze proc based on lvl difference
            local power = 30 + (player:getMainLvl() - target:getMainLvl())*3;
            if (power > 35) then
                power = 35;
            end
            if (power < 5) then
                power = 5;
            end
            target:addStatusEffect(EFFECT_PARALYSIS, power, 0, duration);
        end
    end
    return tpHits, extraHits, criticalHit, damage;

end
