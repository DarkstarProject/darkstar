-----------------------------------------
-- Trust: Shantotto II
-----------------------------------------
-- require("scripts/globals/trust");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    print("Trust example onMagicCastingCheck: working");
    return 0;
end;

function onSpellCast(caster,target,spell)
    print("Trust example onSpellCast: working");
    return 0;
end;
