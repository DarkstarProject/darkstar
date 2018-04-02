-----------------------------------------
-- Spell: Shantotto
-----------------------------------------
-- require("scripts/globals/trust");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    print("Trust example onMagicCastingCheck: working");
    return 0;
end;

function onSpellCast(caster,target,spell)
    caster:spawnTrust(73);
    return 0;
end;
