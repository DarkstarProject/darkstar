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
        player:addStatusEffect(dsp.effects.MAX_HP_BOOST,1000,0,0);
        player:addStatusEffect(dsp.effects.MAX_MP_BOOST,1000,0,0);
        player:addStatusEffect(dsp.effects.MIGHTY_STRIKES,1,0,0);
        player:addStatusEffect(dsp.effects.HUNDRED_FISTS,1,0,0);
        player:addStatusEffect(dsp.effects.CHAINSPELL,1,0,0);
        player:addStatusEffect(dsp.effects.PERFECT_DODGE,1,0,0);
        player:addStatusEffect(dsp.effects.INVINCIBLE,1,0,0);
        player:addStatusEffect(dsp.effects.ELEMENTAL_SFORZO,1,0,0);
        player:addStatusEffect(dsp.effects.MANAFONT,1,0,0);
        player:addStatusEffect(dsp.effects.REGAIN,300,0,0);
        player:addStatusEffect(dsp.effects.REFRESH,99,0,0);
        player:addStatusEffect(dsp.effects.REGEN,99,0,0);

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
        player:delStatusEffect(dsp.effects.MAX_HP_BOOST);
        player:delStatusEffect(dsp.effects.MAX_MP_BOOST);
        player:delStatusEffect(dsp.effects.MIGHTY_STRIKES);
        player:delStatusEffect(dsp.effects.HUNDRED_FISTS);
        player:delStatusEffect(dsp.effects.CHAINSPELL);
        player:delStatusEffect(dsp.effects.PERFECT_DODGE);
        player:delStatusEffect(dsp.effects.INVINCIBLE);
        player:delStatusEffect(dsp.effects.ELEMENTAL_SFORZO);
        player:delStatusEffect(dsp.effects.MANAFONT);
        player:delStatusEffect(dsp.effects.REGAIN);
        player:delStatusEffect(dsp.effects.REFRESH);
        player:delStatusEffect(dsp.effects.REGEN);

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