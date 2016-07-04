-----------------------------------
-- Dragon Kick
-- Hand-to-Hand weapon skill
-- Skill Level: 225
-- Damage varies with TP.
-- Despite the name, Dragon Kick damage is not affected by Kick Attacks or equipment that enhances kick attacks such as Dune Boots. http://www.bluegartr.com/threads/121610-Rehauled-Weapon-Skills-tier-lists?p=6140907&viewfull=1#post6140907
-- Will stack with Sneak Attack.
-- Aligned with the Breeze Gorget & Thunder Gorget.
-- Aligned with the Breeze Belt & Thunder Belt.
-- Element: None
-- Modifiers: STR:50% ; VIT:50%
-- 100%TP    200%TP    300%TP
-- 2.00      2.75      3.50
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary)

    local params = {};
    params.numHits = 1;
    params.ftp100 = 2; params.ftp200 = 2.75; params.ftp300 = 3.5;
    params.str_wsc = 0.5; params.dex_wsc = 0.0; params.vit_wsc = 0.5; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp100 = 2.0; params.ftp200 = 3.6; params.ftp300 = 6.5;
        params.dex_wsc = 0.5; params.vit_wsc = 0.0;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, primary);
    return tpHits, extraHits, criticalHit, damage;

end
