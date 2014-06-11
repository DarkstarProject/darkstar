-----------------------------------------
-- Spell: Raise
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
    if (target:isPC()) then
        target:sendRaise(3);
    else
        if (target:getName() == "Prishe") then
            -- CoP 8-4 Prishe
            local raise, hf, bene = target:getExtraVar(3);
            target:setExtraVar(1,hf,bene);
        end
    end
    spell:setMsg(309);

    return 3;
end;