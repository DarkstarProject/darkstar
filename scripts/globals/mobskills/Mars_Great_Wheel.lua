---------------------------------------------
-- Great Wheel (Mars Custom Version)
--
-- Wipes Shadows and damages enemies in an area of effect.
-- Grants potent Endark to Mars
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1;
    local accmod = 1;
    local dmgmod = 2.0;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,MOBPARAM_3_SHADOW);

    if (mob:hasStatusEffect(EFFECT_ENDARK)) then
        mob:delStatusEffectSilent(EFFECT_ENDARK);
    elseif (mob:hasStatusEffect(EFFECT_ENWATER)) then
        mob:delStatusEffectSilent(EFFECT_ENWATER);
    elseif (mob:hasStatusEffect(EFFECT_ENTHUNDER)) then
        mob:delStatusEffectSilent(EFFECT_ENTHUNDER);
    elseif (mob:hasStatusEffect(EFFECT_ENSTONE)) then
        mob:delStatusEffectSilent(EFFECT_ENSTONE);
    elseif (mob:hasStatusEffect(EFFECT_ENAERO)) then
        mob:delStatusEffectSilent(EFFECT_ENAERO);
    elseif (mob:hasStatusEffect(EFFECT_ENBLIZZARD)) then
        mob:delStatusEffectSilent(EFFECT_ENBLIZZARD);
    elseif (mob:hasStatusEffect(EFFECT_ENFIRE)) then
        mob:delStatusEffectSilent(EFFECT_ENFIRE);
    end
    mob:addStatusEffect(EFFECT_ENDARK,65, 0, 60);
    resetMusic(target)
    target:delHP(dmg);

    return dmg;
end;

function resetMusic(target)
    if (target:getParty() ~= nil) then
        local targets = target:getParty();
        for hey, dude in pairs(targets) do
            if (dude:isPC()) then
                dude:ChangeMusic(0, 195); -- Background Music (Day time, 7:00 -> 18:00)
                dude:ChangeMusic(1, 195); -- Background Music (Night time, 18:00 -> 7:00)
                dude:ChangeMusic(2, 195); -- SoloBattle Music
                dude:ChangeMusic(3, 195); -- Party Battle Music
            end
        end
    elseif (target:isPC()) then
        target:ChangeMusic(0, 195); -- Background Music (Day time, 7:00 -> 18:00)
        target:ChangeMusic(1, 195); -- Background Music (Night time, 18:00 -> 7:00)
        target:ChangeMusic(2, 195); -- SoloBattle Music
        target:ChangeMusic(3, 195); -- Party Battle Music
    end
end;
