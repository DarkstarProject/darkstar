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
        pet:addStatusEffect(dsp.effects.MAX_HP_BOOST,1000,0,0);
        pet:addStatusEffect(dsp.effects.MAX_MP_BOOST,1000,0,0);
        pet:addStatusEffect(dsp.effects.SENTINEL,100,0,0);
        pet:addStatusEffect(dsp.effects.MIGHTY_STRIKES,1,0,0);
        pet:addStatusEffect(dsp.effects.HUNDRED_FISTS,1,0,0);
        pet:addStatusEffect(dsp.effects.CHAINSPELL,1,0,0);
        pet:addStatusEffect(dsp.effects.PERFECT_DODGE,1,0,0);
        pet:addStatusEffect(dsp.effects.INVINCIBLE,1,0,0);
        pet:addStatusEffect(dsp.effects.MANAFONT,1,0,0);
        pet:addStatusEffect(dsp.effects.REGAIN,150,1,0);
        pet:addStatusEffect(dsp.effects.REFRESH,99,0,0);
        pet:addStatusEffect(dsp.effects.REGEN,99,0,0);

        -- Add bonus mods to the pet..
        pet:addMod(MOD_RACC,2500);
        pet:addMod(MOD_RATT,2500);
        pet:addMod(MOD_ACC,2500);
        pet:addMod(MOD_ATT,2500);
        pet:addMod(MOD_MATT,2500);
        pet:addMod(MOD_MACC,2500);
        pet:addMod(MOD_RDEF,2500);
        pet:addMod(MOD_DEF,2500);
        pet:addMod(MOD_MDEF,2500);

        -- Heal the pet from the new buffs..
        pet:addHP( 50000 );
        pet:setMP( 50000 );
    else
        -- Toggle GodMode off..
        pet:setLocalVar("GodMode", 0);

        -- Remove bonus effects..
        pet:delStatusEffect(dsp.effects.MAX_HP_BOOST);
        pet:delStatusEffect(dsp.effects.MAX_MP_BOOST);
        pet:delStatusEffect(dsp.effects.SENTINEL);
        pet:delStatusEffect(dsp.effects.MIGHTY_STRIKES);
        pet:delStatusEffect(dsp.effects.HUNDRED_FISTS);
        pet:delStatusEffect(dsp.effects.CHAINSPELL);
        pet:delStatusEffect(dsp.effects.PERFECT_DODGE);
        pet:delStatusEffect(dsp.effects.INVINCIBLE);
        pet:delStatusEffect(dsp.effects.MANAFONT);
        pet:delStatusEffect(dsp.effects.REGAIN);
        pet:delStatusEffect(dsp.effects.REFRESH);
        pet:delStatusEffect(dsp.effects.REGEN);

        -- Remove bonus mods..
        pet:delMod(MOD_RACC,2500);
        pet:delMod(MOD_RATT,2500);
        pet:delMod(MOD_ACC,2500);
        pet:delMod(MOD_ATT,2500);
        pet:delMod(MOD_MATT,2500);
        pet:delMod(MOD_MACC,2500);
        pet:delMod(MOD_RDEF,2500);
        pet:delMod(MOD_DEF,2500);
        pet:delMod(MOD_MDEF,2500);
    end
end