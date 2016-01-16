---------------------------------------------------
-- Zantetsuken
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/magic");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
    local power = master:getMP() / master:getMaxMP();
    master:setMP(0);

    if (target:isNM()) then
        local dmg = 0.1 * target:getHP() + 0.1 * target:getHP() * power;
        if (dmg > 9999) then
            dmg = 9999;
        end
        dmg = MobMagicalMove(pet,target,skill,dmg,ELE_DARK,1,TP_NO_EFFECT,0);
        dmg = mobAddBonuses(pet, nil, target, dmg.dmg, ELE_DARK);
        dmg = AvatarFinalAdjustments(dmg,pet,skill,target,MOBSKILL_MAGICAL,MOBPARAM_NONE,1);
        target:delHP(dmg);
        target:updateEnmityFromDamage(pet,dmg);
        return dmg;
    else
        local chance = (100 * power) / skill:getTotalTargets();
        if math.random(0,99) < chance and target:getAnimation() ~= 33 then
            skill:setMsg(MSG_ENFEEB_IS);
            target:delHP(target:getHP());
            return EFFECT_KO;
        else
            skill:setMsg(282);
            return 0;
        end
    end
end