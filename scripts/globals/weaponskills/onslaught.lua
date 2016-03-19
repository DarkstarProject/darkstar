-----------------------------------
-- Onslaught
-- Axe weapon skill
-- Skill Level: N/A
-- Lowers target's params.accuracy. Additional effect: temporarily increases Attack.
-- Available only when equipped with the Relic Weapons Ogre Killer (Dynamis use only) or Guttler or Cleofun Axe (with Latent active).
-- These Relic Weapons are only available to Beastmasters, so only they can use this Weapon Skill.
-- One hit attack despite of non single-hit animation
-- The attack increase seems to be 10%.
-- Aligned with the Shadow Gorget & Soil Gorget.
-- Aligned with the Shadow Belt & Soil Belt.
-- Element: None
-- Modifiers: DEX:80%
-- 100%TP    200%TP    300%TP
-- 2.75      2.75      2.75
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------
function onUseWeaponSkill(player, target, wsID, tp, primary)

    local params = {};
    params.numHits = 1;
    params.ftp100 = 2.75; params.ftp200 = 2.75; params.ftp300 = 2.75;
    params.str_wsc = 0.0; params.dex_wsc = 0.6; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.dex_wsc = 0.8;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, primary);
    -- TODO: Whoever codes those level 85 weapons with the latent that grants this WS needs to code a check to not give the aftermath effect.
    if (damage > 0) then
        local amDuration = 20 * math.floor(tp/1000);
        player:addStatusEffect(EFFECT_AFTERMATH, 10, 0, amDuration, 0, 4);
        target:addStatusEffect(EFFECT_ACCURACY_DOWN, 20, 0, 60);
    end

    return tpHits, extraHits, criticalHit, damage;
end