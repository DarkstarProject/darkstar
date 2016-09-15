---------------------------------------------------------------------------------------------------
-- func: godmode
-- desc: Toggles god mode on the player; granting them several special abilities.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
};

function onTrigger(player)
    if (player:getVar("GodMode") == 0) then
        -- Toggle GodMode on..
        player:setVar("GodMode", 1);

        -- Add bonus effects to the player..
        player:addStatusEffect(EFFECT_MAX_HP_BOOST,1000,0,0);
        player:addStatusEffect(EFFECT_MAX_MP_BOOST,1000,0,0);
        player:addStatusEffect(EFFECT_SENTINEL,100,0,0);
        player:addStatusEffect(EFFECT_MIGHTY_STRIKES,1,0,0);
        player:addStatusEffect(EFFECT_HUNDRED_FISTS,1,0,0);
        player:addStatusEffect(EFFECT_CHAINSPELL,1,0,0);
        player:addStatusEffect(EFFECT_PERFECT_DODGE,1,0,0);
        player:addStatusEffect(EFFECT_INVINCIBLE,1,0,0);
        player:addStatusEffect(EFFECT_MANAFONT,1,0,0);
        player:addStatusEffect(EFFECT_REGAIN,150,1,0);
        player:addStatusEffect(EFFECT_REFRESH,99,0,0);
        player:addStatusEffect(EFFECT_REGEN,99,0,0);

        -- Add bonus mods to the player..
        player:addMod(MOD_RACC,2500);
        player:addMod(MOD_RATT,2500);
        player:addMod(MOD_ACC,2500);
        player:addMod(MOD_ATT,2500);
        player:addMod(MOD_MATT,2500);
        player:addMod(MOD_MACC,2500);
        player:addMod(MOD_RDEF,2500);
        player:addMod(MOD_DEF,2500);
        player:addMod(MOD_MDEF,2500);

        -- Heal the player from the new buffs..
        player:addHP( 50000 );
        player:setMP( 50000 );
    else
        -- Toggle GodMode off..
        player:setVar("GodMode", 0);

        -- Remove bonus effects..
        player:delStatusEffect(EFFECT_MAX_HP_BOOST);
        player:delStatusEffect(EFFECT_MAX_MP_BOOST);
        player:delStatusEffect(EFFECT_SENTINEL);
        player:delStatusEffect(EFFECT_MIGHTY_STRIKES);
        player:delStatusEffect(EFFECT_HUNDRED_FISTS);
        player:delStatusEffect(EFFECT_CHAINSPELL);
        player:delStatusEffect(EFFECT_PERFECT_DODGE);
        player:delStatusEffect(EFFECT_INVINCIBLE);
        player:delStatusEffect(EFFECT_MANAFONT);
        player:delStatusEffect(EFFECT_REGAIN);
        player:delStatusEffect(EFFECT_REFRESH);
        player:delStatusEffect(EFFECT_REGEN);

        -- Remove bonus mods..
        player:delMod(MOD_RACC,2500);
        player:delMod(MOD_RATT,2500);
        player:delMod(MOD_ACC,2500);
        player:delMod(MOD_ATT,2500);
        player:delMod(MOD_MATT,2500);
        player:delMod(MOD_MACC,2500);
        player:delMod(MOD_RDEF,2500);
        player:delMod(MOD_DEF,2500);
        player:delMod(MOD_MDEF,2500);
    end
end