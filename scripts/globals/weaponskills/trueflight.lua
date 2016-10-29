-----------------------------------
-- Skill Level: N/A
-- Description: Deals light elemental damage. Damage varies with TP. Gastraphetes: Aftermath effect varies with TP.
-- Available only after completing the Unlocking a Myth (Ranger) quest.
-- Does not work with Flashy Shot.
-- Does not work with Stealth Shot.
-- Aligned with the Breeze Gorget, Thunder Gorget & Soil Gorget.
-- Aligned with the Breeze Belt, Thunder Belt & Soil Belt.
-- Properties
-- Element: Light
-- Skillchain Properties: Fragmentation/Scission
-- Modifiers: AGI:30%
-- Damage Multipliers by TP:
--  100%TP    200%TP    300%TP
--   4.0    4.25    4.75
-----------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary)

    local params = {};
    params.ftp100 = 4; params.ftp200 = 4.25; params.ftp300 = 4.75;
    params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0;
    params.agi_wsc = 0.3; params.int_wsc = 0.0; params.mnd_wsc = 0.0;
    params.chr_wsc = 0.0;
    params.ele = ELE_LIGHT;
    params.skill = SKILL_MRK;
    params.includemab = true;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp100 = 3.8906; params.ftp200 = 6.3906; params.ftp300 = 9.3906;
        params.agi_wsc = 1.0;
    end

    local damage, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, params, tp, primary);

    if ((player:getEquipID(SLOT_RANGED) == 19001) and (player:getMainJob() == JOBS.RNG)) then
        if (damage > 0) then
            local params = initAftermathParams()
            params.subpower.lv1 = 3
            params.subpower.lv2 = 4
            params.subpower.lv3  =2
            applyAftermathEffect(player, tp, params)
        end
    end
    return tpHits, extraHits, criticalHit, damage;

end;
