-----------------------------------
-- Atonement
-- TODO: This needs to be reworked, as this weapon skill does damage based on current enmity, not based on stat modifiers. http://wiki.ffxiclopedia.org/wiki/Atonement    http://www.bg-wiki.com/bg/Atonement
-- Sword weapon skill
-- Skill Level: N/A
-- Delivers a Twofold attack. Damage varies with TP. Conqueror: Aftermath effect varies with TP.
-- Available only after completing the Unlocking a Myth (Paladin) quest.
-- Aligned with the Aqua Gorget, Flame Gorget & Light Gorget.
-- Aligned with the Aqua Belt, Flame Belt & Light Belt.
-- Element: None
-- Modifiers: STR:40% VIT:50%
-- 100%TP    200%TP    300%TP
-- 1.00      1.25      1.50
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary)

    local params = {};
    params.numHits = 2;
    params.ftp100 = 1; params.ftp200 = 1.25; params.ftp300 = 1.5;
    params.str_wsc = 0.4; params.dex_wsc = 0.0; params.vit_wsc = 0.5; params.agi_wsc = 0.0; params.int_wsc = 0.0;
    params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp100 = 1; params.ftp200 = 1.5; params.ftp300 = 2.0;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, primary);
    if ((player:getEquipID(SLOT_MAIN) == 18997) and (player:getMainJob() == JOB_PLD)) then
        if (damage > 0) then
            applyAftermathEffect(player, tp)
        end
    end
    return tpHits, extraHits, criticalHit, damage;

end
