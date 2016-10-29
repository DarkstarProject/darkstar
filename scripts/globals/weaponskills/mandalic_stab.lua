-----------------------------------
-- Mandalic Stab
-- Dagger weapon skill
-- Skill Level: N/A
-- Damage Varies with TP. Vajra: Aftermath effect varies with TP.
-- Multiplies attack by 1.66
-- Available only after completing the Unlocking a Myth (Thief) quest.
-- Will stack with Sneak Attack.
-- Aligned with the Shadow Gorget, Flame Gorget & Light Gorget.
-- Aligned with the Shadow Belt, Flame Belt & Light Belt.
-- Element: None
-- Modifiers: DEX:30%
-- 100%TP    200%TP    300%TP
-- 2.00      2.13      2.50
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary)

    local params = {};
    params.numHits = 1;
    params.ftp100 = 2; params.ftp200 = 2.13; params.ftp300 = 2.5;
    params.str_wsc = 0.0; params.dex_wsc = 0.3; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; 
    params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1.66;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp100 = 5; params.ftp200 = 8.5; params.ftp300 = 11.75;
        params.dex_wsc = 0.6;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, primary);

    if ((player:getEquipID(SLOT_MAIN) == 18996) and (player:getMainJob() == JOBS.THF)) then
        if (damage > 0) then
            applyAftermathEffect(player, tp)
        end
    end
    return tpHits, extraHits, criticalHit, damage;

end
