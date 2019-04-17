-------------------------------------------------
--  Trust: Shantotto
--  Magic: Elemental Nukes I-V (Fire, Earth, Water, Wind, Ice, Thunder);
--  JA: None
--  WS: None;
--  AutoAttack: No
--  Source: http://bg-wiki.com/bg/Category:Trust
-------------------------------------------------

require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/magic")

function onMobSpawn(mob)
    mob:SetAutoAttackEnabled(false)
end

function onMobFight(entity, target)
    local spell = chooseSpell(entity, target)
    if(spell == nil) then
        return
    end

    if(not entity:hasRecast(1, spell[3])) then
        entity:castSpell(spell[3], target)
        entity:addRecast(1, spell[3], spell[4])
    end 
end

Spell = 
{
    LEVEL,
    MP_COST,
    SPELL_ID,
    RECAST
}

ele = {
    FIRE,
    EARTH,
    WATER,
    WIND,
    ICE,
    THUNDER,
    LIGHT,
    DARK
};

eleSpells = {};             --MLevel, MP Cost, SpellID, Recast
eleSpells[1] = 
{
    {13, 7, 144, 2},        --Fire
    {38, 26, 145, 6},       --Fire II
    {62, 63, 146, 15},      --Fire III
    {73, 135, 147, 30},     --Fire IV
    {86, 228, 148, 45}      --Fire V
}
eleSpells[2] = 
{
    {1, 4, 159, 2},         --Stone
    {26, 16, 160, 6},       --Stone II
    {51, 40, 161, 15},      --Stone III
    {68, 88, 162, 30},      --Stone IV
    {77, 156, 163, 45}      --Stone V
}
eleSpells[3] = 
{
    {5, 5, 169, 2},         --Water
    {30, 19, 170, 6},       --Water II
    {55, 46, 171, 15},      --Water III
    {70, 99, 172, 30},      --Water IV
    {80, 175, 173, 45},     --Water V
}
eleSpells[4] = 
{
    {9, 6, 154, 2},         --Aero
    {34, 22, 155, 6},       --Aero II
    {59, 54, 156, 15},      --Aero III
    {72, 115, 157, 30},     --Aero IV
    {83, 198, 158, 45}      --Aero V
}
eleSpells[5] = 
{
    {17, 8, 149, 2},        --Blizzard
    {42, 31, 150, 6},       --Blizzard II
    {64, 75, 151, 15},      --Blizzard III
    {74, 162, 152, 30},     --Blizzard IV
    {89, 267, 153, 45},     --Blizzard V
}
eleSpells[6] = 
{
    {21, 9, 164, 2},        --Thunder
    {46, 37, 165, 6},       --Thunder II
    {66, 91, 166, 15},      --Thunder III
    {75, 195, 167, 30},     --Thunder IV
    {92, 306, 168, 45},     --Thunder V
}



function chooseSpell(caster, target)
    ele = eleWithLowestResist(target)
    if(ele == nil) then
        return ele
    end
    return chooseHighestEleSpell(caster, ele)
end

function getElementalResistance(target, element)
    return target:getMod(dsp.magic.resistMod[element])
end

function eleWithLowestResist(target)
    local lowest = 100;
    local ele = nil;
    for i = 1, 6, 1
    do 
        local res = getElementalResistance(target, i)
        if(res < lowest) then 
            lowest = res
            ele = i
        end
    end
    return ele;
end

function chooseHighestEleSpell(caster, element)
    local lvl = caster:getMainLvl()
    local mp = caster:getMP()
    local last = nil;
    for i = 1, #eleSpells[element] do 
        local spell = eleSpells[element][i]
        if(spell[1] > lvl or spell[2] > mp) then
            return last
        end
        last = spell
    end

end