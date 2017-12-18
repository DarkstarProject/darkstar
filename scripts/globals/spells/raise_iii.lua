-----------------------------------------
-- Spell: Raise
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    if (target:isPC()) then
        target:sendRaise(3);
    else
        if (target:getName() == "Prishe") then
            -- CoP 8-4 Prishe
            target:setLocalVar("Raise", 1);
        end
    end
    spell:setMsg(msgBasic.MAGIC_CASTS_ON);

    return 3;
end;
