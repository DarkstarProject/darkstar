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
        pet:addStatusEffect(EFFECT_MAX_HP_BOOST,1000,0,0);
        pet:addStatusEffect(EFFECT_MAX_MP_BOOST,1000,0,0);
        pet:addStatusEffect(EFFECT_SENTINEL,100,0,0);
        pet:addStatusEffect(EFFECT_MIGHTY_STRIKES,1,0,0);
        pet:addStatusEffect(EFFECT_HUNDRED_FISTS,1,0,0);
        pet:addStatusEffect(EFFECT_CHAINSPELL,1,0,0);
        pet:addStatusEffect(EFFECT_PERFECT_DODGE,1,0,0);
        pet:addStatusEffect(EFFECT_INVINCIBLE,1,0,0);
        pet:addStatusEffect(EFFECT_MANAFONT,1,0,0);
        pet:addStatusEffect(EFFECT_REGAIN,150,1,0);
        pet:addStatusEffect(EFFECT_REFRESH,99,0,0);
        pet:addStatusEffect(EFFECT_REGEN,99,0,0);

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
        pet:delStatusEffect(EFFECT_MAX_HP_BOOST);
        pet:delStatusEffect(EFFECT_MAX_MP_BOOST);
        pet:delStatusEffect(EFFECT_SENTINEL);
        pet:delStatusEffect(EFFECT_MIGHTY_STRIKES);
        pet:delStatusEffect(EFFECT_HUNDRED_FISTS);
        pet:delStatusEffect(EFFECT_CHAINSPELL);
        pet:delStatusEffect(EFFECT_PERFECT_DODGE);
        pet:delStatusEffect(EFFECT_INVINCIBLE);
        pet:delStatusEffect(EFFECT_MANAFONT);
        pet:delStatusEffect(EFFECT_REGAIN);
        pet:delStatusEffect(EFFECT_REFRESH);
        pet:delStatusEffect(EFFECT_REGEN);

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