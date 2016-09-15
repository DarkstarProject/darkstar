---------------------------------------------------------------------------------------------------
-- func: superman
-- auth: kernel
-- desc: Toggles superman on the player; granting them several special abilities.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
};

    function onTrigger(player) 

        -- Add bonus mods to the player..
        player:addMod(MOD_STR,999);
        player:addMod(MOD_DEX,999);
        player:addMod(MOD_AGI,999);
        player:addMod(MOD_ATT,999);
        player:addMod(MOD_VIT,999);
        player:addMod(MOD_INT,999);
        player:addMod(MOD_MND,999);
        player:addMod(MOD_CHR,999);
        player:addMod(MOD_ATT,2500);
		player:addMod(MOD_DEF,2500);
		player:addMod(MOD_ACC,2500);
		player:addMod(MOD_ACC,2500);
		player:addStatusEffect(EFFECT_MAGIC_ATK_BOOST,100,1,0);
	

end