-----------------------------------
-- Omniscience
-- Staff weapon skill
-- Skill Level: N/A
-- Lowers target's magic attack. Duration of effect varies with TP. Tupsimati: Aftermath effect varies with TP.
-- Reduces enemy's magic attack by -10.
-- Available only after completing the Unlocking a Myth (Scholar) quest.
-- Aligned with the Shadow Gorget, Soil Gorget & Light Gorget.
-- Aligned with the Shadow Belt, Soil Belt & Light Belt.
-- Element: Dark
-- Modifiers: MND:80%
-- 100%TP    200%TP    300%TP
-- 2.00      2.00      2.00
-----------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary)

    local params = {};
    params.ftp100 = 2; params.ftp200 = 2; params.ftp300 = 2;
    params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0;  
    params.mnd_wsc = 0.3; params.chr_wsc = 0.0;
    params.ele = ELE_DARK;
    params.skill = SKILL_STF;
    params.includemab = true;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.mnd_wsc = 0.8;
    end

    local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, params, tp, primary);

    if (damage > 0) then
        local duration = (tp/1000 * 60);
        if (target:hasStatusEffect(EFFECT_MAGIC_ATK_DOWN) == false) then
            target:addStatusEffect(EFFECT_MAGIC_ATK_DOWN, 10, 0, duration);
        end
    end

    if ((player:getEquipID(SLOT_MAIN) == 18990) and (player:getMainJob() == JOBS.SCH)) then
        if (damage > 0) then
            local params = initAftermathParams()
            params.power.lv2_inc = 1
            params.subpower.lv1 = 2
            params.subpower.lv2 = 3
            params.subpower.lv3 = 1
            applyAftermathEffect(player, tp, params)
        end
    end

    return tpHits, extraHits, criticalHit, damage;
end
