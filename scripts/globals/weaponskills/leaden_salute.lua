-----------------------------------
-- Leaden Salute
-- Sword weapon skill
-- Skill Level: N/A
-- Delivers a Twofold attack. Damage varies with TP. Death Penalty: Aftermath effect varies with TP.
-- Available only after completing the Unlocking a Myth (Corsair) quest.
-- Aligned with the Shadow Gorget, Soil Gorget & Light Gorget.
-- Aligned with the Shadow Belt, Soil Belt & Light Belt.
-- Element: Darkness
-- Modifiers: AGI:30%
-- 100%TP    200%TP    300%TP
-- 4.00      4.25      4.75
-----------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary)

    local params = {};
    params.ftp100 = 4; params.ftp200 = 4.25; params.ftp300 = 4.75;
    params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.3; params.int_wsc = 0.0; 
    params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.ele = ELE_DARK;
    params.skill = SKILL_MRK;
    params.includemab = true;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp200 = 6.7; params.ftp300 = 10.0;
        params.agi_wsc = 1.0;
    end

    local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, params, tp, primary);

    if ((player:getEquipID(SLOT_RANGED) == 19007) and (player:getMainJob() == JOBS.COR)) then
        if (damage > 0) then
            local params = initAftermathParams()
            params.subpower.lv1 = 3
            params.subpower.lv2 = 4
            params.subpower.lv3 = 2
            applyAftermathEffect(player, tp, params)
        end
    end
    return tpHits, extraHits, criticalHit, damage;

end
