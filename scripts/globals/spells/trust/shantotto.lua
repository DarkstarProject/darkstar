-----------------------------------------
-- Spell: Shantotto
-----------------------------------------
-- require("scripts/globals/trust");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
     -- This should be done automatic from the spell ID converted to the trust ID without a script command..
    caster:spawnTrust(73); -- It's a pet ID, 0 will spawn a fire spirit.
    return 0;
end;
