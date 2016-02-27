-----------------------------------
-- Spirits Within
-- Sword weapon skill
-- Spirits Within Sword Weapon Skill
-- TrolandAdded by Troland
-- Skill Level: 175
-- Delivers an unavoidable attack. Damage varies with HP and TP.
-- Not aligned with any "elemental gorgets" or "elemental belts" due to it's absence of Skillchain properties.
-- Element: None
-- Modifiers: HP:
-- 100%TP    200%TP    300%TP
-- 12.5%       50%      100%
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
require("scripts/globals/utils");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, TP, primary)

    local HP = player:getHP();
    local WSC = 0;
    -- Damage calculations based on https://www.bg-wiki.com/index.php?title=Spirits_Within&oldid=269806
    if (TP == 300) then
        WSC = math.floor(HP * 120/256);
    elseif (TP >= 200) then
        WSC = math.floor(HP * (math.floor(0.72 * TP) - 96) / 256)
    elseif (TP >= 100) then
        WSC = math.floor(HP * (math.floor(0.16 * TP) + 16) / 256)
    end

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        -- Damage calculations changed based on: http://www.bg-wiki.com/bg/Spirits_Within http://www.bluegartr.com/threads/121610-Rehauled-Weapon-Skills-tier-lists?p=6142188&viewfull=1#post6142188
        if (TP == 300) then
            WSC = HP;
        elseif (TP >= 200) then
            WSC = math.floor(HP * .5);
        elseif (TP >= 100) then
            WSC = math.floor(HP * .125);
        end
    end

    local damage = target:breathDmgTaken(WSC);
    damage = damage * WEAPON_SKILL_POWER
    if (player:getMod(MOD_WEAPONSKILL_DAMAGE_BASE + wsID) > 0) then
        damage = damage * (100 + attacker:getMod(MOD_WEAPONSKILL_DAMAGE_BASE + wsID))/100
    end

    damage = target:takeWeaponskillDamage(player, damage, SLOT_MAIN, 1, 0, 1);
    target:updateEnmityFromDamage(player, damage);
    return 1, 0, false, damage;

end
