-----------------------------------
-- Insurgency
-- Scythe weapon skill
-- Skill level: N/A
-- Delivers a fourfold attack. Damage varies with TP. Liberator: Aftermath effect varies with TP.
-- Available only after completing the Unlocking a Myth (Dark Knight) quest.
-- Appears to be heavily modified by attack.
-- Aligned with the Flame Gorget, Light Gorget & Shadow Gorget.
-- Aligned with the Flame Belt, Light Belt & Shadow Belt.
-- Element: None
-- Modifiers: STR:20% ; INT:20%
-- 100%TP    200%TP    300%TP
-- 0.50      0.75      1.00
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary)

    local params = {};
    params.numHits = 4;
    params.ftp100 = 0.5; params.ftp200 = 0.75; params.ftp300 = 1;
    params.str_wsc = 0.2; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.2; 
    params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp200 = 3.25; params.ftp300 = 6;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, primary);

    if ((player:getEquipID(SLOT_MAIN) == 18998) and (player:getMainJob() == JOBS.DRK)) then
        if (damage > 0) then
            applyAftermathEffect(player, tp)
        end
    end
    return tpHits, extraHits, criticalHit, damage;

end
