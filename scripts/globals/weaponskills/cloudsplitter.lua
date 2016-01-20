-----------------------------------
-- Cloudsplitter
-- Axe weapon skill
-- Skill level: NA
-- Description: Deals lightning elemental damage. Damage varies with TP. Farsha: Aftermath.
-- Available only when equipped with Farsha (85), Farsha (90) or Alard's Axe +1.
-- Elemental gorgets do not affect damage. Rairin Obi increases damage on Lightning day and/or weather.
-- Element: Lightning
-- Modifiers: STR:40% MND:40%
-- 100%TP    200%TP    300%TP
-- 3.75        5.0      6.0
-----------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary)

    local params = {};
    params.ftp100 = 3.75; params.ftp200 = 5.0; params.ftp300 = 6.0;
    params.str_wsc = 0.4; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.4; params.chr_wsc = 0.0;
    params.ele = ELE_LIGHTNING;
    params.skill = SKILL_AXE;
    params.includemab = true;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp200 = 6.7; params.ftp300 = 8.5;
    end

    local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, params, tp, primary);
    return tpHits, extraHits, criticalHit, damage;

end
