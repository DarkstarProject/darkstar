---------------------------------------------------------------------------------------------------
-- func: godmode
-- desc: Toggles god mode on the player, granting them several special abilities.
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
        player:addStatusEffect(EFFECT.MAX_HP_BOOST,1000,0,0);
        player:addStatusEffect(EFFECT.MAX_MP_BOOST,1000,0,0);
        player:addStatusEffect(EFFECT.MIGHTY_STRIKES,1,0,0);
        player:addStatusEffect(EFFECT.HUNDRED_FISTS,1,0,0);
        player:addStatusEffect(EFFECT.CHAINSPELL,1,0,0);
        player:addStatusEffect(EFFECT.PERFECT_DODGE,1,0,0);
        player:addStatusEffect(EFFECT.INVINCIBLE,1,0,0);
        player:addStatusEffect(EFFECT.ELEMENTAL_SFORZO,1,0,0);
        player:addStatusEffect(EFFECT.MANAFONT,1,0,0);
        player:addStatusEffect(EFFECT.REGAIN,300,0,0);
        player:addStatusEffect(EFFECT.REFRESH,99,0,0);
        player:addStatusEffect(EFFECT.REGEN,99,0,0);

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
        player:delStatusEffect(EFFECT.MAX_HP_BOOST);
        player:delStatusEffect(EFFECT.MAX_MP_BOOST);
        player:delStatusEffect(EFFECT.MIGHTY_STRIKES);
        player:delStatusEffect(EFFECT.HUNDRED_FISTS);
        player:delStatusEffect(EFFECT.CHAINSPELL);
        player:delStatusEffect(EFFECT.PERFECT_DODGE);
        player:delStatusEffect(EFFECT.INVINCIBLE);
        player:delStatusEffect(EFFECT.ELEMENTAL_SFORZO);
        player:delStatusEffect(EFFECT.MANAFONT);
        player:delStatusEffect(EFFECT.REGAIN);
        player:delStatusEffect(EFFECT.REFRESH);
        player:delStatusEffect(EFFECT.REGEN);

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