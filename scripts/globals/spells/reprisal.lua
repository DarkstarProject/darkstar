-----------------------------------------
-- Spell: Reprisal
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
    local duration = 60;
  local typeEffect = EFFECT_REPRISAL;
    if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end

    local int = caster:getStat(MOD_MND);
    local magicAtk = caster:getMod(MOD_MATT);

    -- totally guessing
    local power = ((int + 10) / 20 + 2) * (1 + (magicAtk / 100));

   if(target:addStatusEffect(typeEffect,power,0,duration)) then
     spell:setMsg(230);
   else
     spell:setMsg(75);
   end

    return typeEffect;
end;
