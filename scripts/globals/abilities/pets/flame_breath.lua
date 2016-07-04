---------------------------------------------------
-- Flame Breath
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/ability");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onUseAbility(pet, target, skill, action)
    local master = pet:getMaster()
    ---------- Deep Breathing ----------
    -- 0 for none
    -- 1 for first merit
    -- 0.25 for each merit after the first
    -- TODO: 0.1 per merit for augmented AF2 (10663 *w/ augment*)
    local deep = 1;
    if (pet:hasStatusEffect(EFFECT_MAGIC_ATK_BOOST) == true) then
        deep = deep + 1 + (master:getMerit(MERIT_DEEP_BREATHING)-1)*0.25;
        pet:delStatusEffect(EFFECT_MAGIC_ATK_BOOST);
    end

    local gear = master:getMod(MOD_WYVERN_BREATH)/256; -- Master gear that enhances breath

    local dmgmod = MobBreathMove(pet, target, 0.185, pet:getMainLvl()*15, ELE_FIRE); -- Works out to (hp/6) + 15, as desired
    dmgmod = (dmgmod * (1+gear))*deep;
    pet:setTP(0)

    local dmg = AbilityFinalAdjustments(dmgmod,pet,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end
