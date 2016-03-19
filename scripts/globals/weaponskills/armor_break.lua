-----------------------------------
-- Armor Break
-- Great Axe weapon skill
-- Skill level: 100
-- Lowers enemy's defense. Duration of effect varies with TP.
-- Lowers defense by as much as 25% if unresisted.
-- Strong against: Antica, Bats, Cockatrice, Dhalmel, Lizards, Mandragora, Worms.
-- Immune: Ahriman.
-- Will stack with Sneak Attack.
-- Aligned with the Thunder Gorget.
-- Aligned with the Thunder Belt.
-- Element: Wind
-- Modifiers: STR:20% ; VIT:20%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary)

    local params = {};
    params.numHits = 1;
    params.ftp100 = 1; params.ftp200 = 1; params.ftp300 = 1;
    params.str_wsc = 0.2; params.dex_wsc = 0.0; params.vit_wsc = 0.2; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 0.6; params.vit_wsc = 0.6;
    end

        local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, primary);
    if (damage > 0) then
        local duration = (tp/1000 * 70) + 60;
        if (target:hasStatusEffect(EFFECT_DEFENSE_DOWN) == false) then
            target:addStatusEffect(EFFECT_DEFENSE_DOWN, 25, 0, duration);
        end
    end
    return tpHits, extraHits, criticalHit, damage;

end
