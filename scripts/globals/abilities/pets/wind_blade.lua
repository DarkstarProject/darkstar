---------------------------------------------------
-- Geocrush
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/magic");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill)

    local dINT = math.floor(pet:getStat(MOD_INT) - target:getStat(MOD_INT));
    local tp = skill:getTP() / 10;
    local master = pet:getMaster();
    local merits = 0;
    if (master ~= nil and master:isPC()) then
        merits = master:getMerit(MERIT_WIND_BLADE);
    end
        
    tp = tp + (merits - 40);
    if (tp > 300) then
        tp = 300;
    end
    
    --note: this formula is only accurate for level 75 - 76+ may have a different intercept and/or slope
    local damage = math.floor(512 + 1.72*(tp+1));
    damage = damage + (dINT * 1.5);
    damage = MobMagicalMove(pet,target,skill,damage,ELE_WIND,1,TP_NO_EFFECT,0);
    damage = mobAddBonuses(pet, nil, target, damage.dmg, ELE_WIND);
    damage = AvatarFinalAdjustments(damage,pet,skill,target,MOBSKILL_MAGICAL,MOBPARAM_NONE,1);

    target:delHP(damage);
    target:updateEnmityFromDamage(pet,damage);

    return damage;
end