-----------------------------------------
-- Spell: Impact
-- Deals dark damage to an enemy and
-- decreases all 7 base stats by 20%
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");

-----------------------------------------
-- onMagicCastingCheck
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
    local dINT = caster:getStat(MOD_INT) - target:getStat(MOD_INT);
    local resist = applyResistance(caster,spell,target,dINT,37,0);
    local STR_Loss = ((target:getStat(MOD_STR) / 100) * 20); -- Should be 20%
    local DEX_Loss = ((target:getStat(MOD_DEX) / 100) * 20);
    local VIT_Loss = ((target:getStat(MOD_VIT) / 100) * 20);
    local AGI_Loss = ((target:getStat(MOD_AGI) / 100) * 20);
    local INT_Loss = ((target:getStat(MOD_INT) / 100) * 20);
    local MND_Loss = ((target:getStat(MOD_MND) / 100) * 20);
    local CHR_Loss = ((target:getStat(MOD_CHR) / 100) * 20);
    local duration = 180 * resist; -- BG wiki suggests only duration gets effected by resist.

    if (target:hasStatusEffect(EFFECT_STR_DOWN) == false) then
        -- caster:PrintToPlayer( string.format( "STR: '%s' ", STR_Loss ) );
        target:addStatusEffect(EFFECT_STR_DOWN,STR_Loss,0,duration);
    end
    if (target:hasStatusEffect(EFFECT_DEX_DOWN) == false) then
        -- caster:PrintToPlayer( string.format( "DEX: '%s' ", DEX_Loss ) );
        target:addStatusEffect(EFFECT_DEX_DOWN,DEX_Loss,0,duration);
    end
    if (target:hasStatusEffect(EFFECT_VIT_DOWN) == false) then
        -- caster:PrintToPlayer( string.format( "VIT: '%s' ", VIT_Loss ) );
        target:addStatusEffect(EFFECT_VIT_DOWN,VIT_Loss,0,duration);
    end
    if (target:hasStatusEffect(EFFECT_AGI_DOWN) == false) then
        -- caster:PrintToPlayer( string.format( "AGI: '%s' ", AGI_Loss ) );
        target:addStatusEffect(EFFECT_AGI_DOWN,AGI_Loss,0,duration);
    end
    if (target:hasStatusEffect(EFFECT_INT_DOWN) == false) then
        -- caster:PrintToPlayer( string.format( "INT: '%s' ", INT_Loss ) );
        target:addStatusEffect(EFFECT_INT_DOWN,INT_Loss,0,duration);
    end
    if (target:hasStatusEffect(EFFECT_MND_DOWN) == false) then
        -- caster:PrintToPlayer( string.format( "MND: '%s' ", MND_Loss ) );
        target:addStatusEffect(EFFECT_MND_DOWN,MND_Loss,0,duration);
    end
    if (target:hasStatusEffect(EFFECT_CHR_DOWN) == false) then
        -- caster:PrintToPlayer( string.format( "CHR: '%s' ", CHR_Loss ) );
        target:addStatusEffect(EFFECT_CHR_DOWN,CHR_Loss,0,duration);
    end

    --diverting use of doElementalNuke till spellParams is implemented for this spell

    --local dmg = doElementalNuke(939,2.335,caster,spell,target,false,1.0);
    --calculate raw damage
    local dmg = calculateMagicDamage(939,2.335,caster,spell,target,ELEMENTAL_MAGIC_SKILL,MOD_INT,false);
    --get resist multiplier (1x if no resist)
    local resist = applyResistance(caster,spell,target,caster:getStat(MOD_INT)-target:getStat(MOD_INT),ELEMENTAL_MAGIC_SKILL,1.0);
    --get the resisted damage
    dmg = dmg*resist;
    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    dmg = addBonuses(caster,spell,target,dmg);
    --add in target adjustment
    dmg = adjustForTarget(target,dmg,spell:getElement());
    --add in final adjustments
    dmg = finalMagicAdjustments(caster,target,spell,dmg);

    return dmg;
end;
