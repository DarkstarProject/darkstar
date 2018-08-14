---------------------------------------------------------------------------------------------------
-- func: petgodmode
-- desc: Toggles god mode on the player's pet, granting them several special abilities.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
};

function onTrigger(player)
    local pet = player:getPet()
    if (pet and pet:getLocalVar("GodMode") == 0) then
        -- Toggle GodMode on..
        pet:setLocalVar("GodMode", 1);

        -- Add bonus effects to the pet..
        pet:addStatusEffect(dsp.effect.MAX_HP_BOOST,1000,0,0);
        pet:addStatusEffect(dsp.effect.MAX_MP_BOOST,1000,0,0);
        pet:addStatusEffect(dsp.effect.SENTINEL,100,0,0);
        pet:addStatusEffect(dsp.effect.MIGHTY_STRIKES,1,0,0);
        pet:addStatusEffect(dsp.effect.HUNDRED_FISTS,1,0,0);
        pet:addStatusEffect(dsp.effect.CHAINSPELL,1,0,0);
        pet:addStatusEffect(dsp.effect.PERFECT_DODGE,1,0,0);
        pet:addStatusEffect(dsp.effect.INVINCIBLE,1,0,0);
        pet:addStatusEffect(dsp.effect.MANAFONT,1,0,0);
        pet:addStatusEffect(dsp.effect.REGAIN,150,1,0);
        pet:addStatusEffect(dsp.effect.REFRESH,99,0,0);
        pet:addStatusEffect(dsp.effect.REGEN,99,0,0);

        -- Add bonus mods to the pet..
        pet:addMod(dsp.mod.RACC,2500);
        pet:addMod(dsp.mod.RATT,2500);
        pet:addMod(dsp.mod.ACC,2500);
        pet:addMod(dsp.mod.ATT,2500);
        pet:addMod(dsp.mod.MATT,2500);
        pet:addMod(dsp.mod.MACC,2500);
        pet:addMod(dsp.mod.RDEF,2500);
        pet:addMod(dsp.mod.DEF,2500);
        pet:addMod(dsp.mod.MDEF,2500);

        -- Heal the pet from the new buffs..
        pet:addHP( 50000 );
        pet:setMP( 50000 );
    else
        -- Toggle GodMode off..
        pet:setLocalVar("GodMode", 0);

        -- Remove bonus effects..
        pet:delStatusEffect(dsp.effect.MAX_HP_BOOST);
        pet:delStatusEffect(dsp.effect.MAX_MP_BOOST);
        pet:delStatusEffect(dsp.effect.SENTINEL);
        pet:delStatusEffect(dsp.effect.MIGHTY_STRIKES);
        pet:delStatusEffect(dsp.effect.HUNDRED_FISTS);
        pet:delStatusEffect(dsp.effect.CHAINSPELL);
        pet:delStatusEffect(dsp.effect.PERFECT_DODGE);
        pet:delStatusEffect(dsp.effect.INVINCIBLE);
        pet:delStatusEffect(dsp.effect.MANAFONT);
        pet:delStatusEffect(dsp.effect.REGAIN);
        pet:delStatusEffect(dsp.effect.REFRESH);
        pet:delStatusEffect(dsp.effect.REGEN);

        -- Remove bonus mods..
        pet:delMod(dsp.mod.RACC,2500);
        pet:delMod(dsp.mod.RATT,2500);
        pet:delMod(dsp.mod.ACC,2500);
        pet:delMod(dsp.mod.ATT,2500);
        pet:delMod(dsp.mod.MATT,2500);
        pet:delMod(dsp.mod.MACC,2500);
        pet:delMod(dsp.mod.RDEF,2500);
        pet:delMod(dsp.mod.DEF,2500);
        pet:delMod(dsp.mod.MDEF,2500);
    end
end