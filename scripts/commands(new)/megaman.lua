---------------------------------------------------------------------------------------------------
-- func: megaman
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
        player:addMod(MOD_STR,200);
        player:addMod(MOD_DEX,200);
        player:addMod(MOD_AGI,200);
        player:addMod(MOD_ATT,200);
        player:addMod(MOD_VIT,200);
        player:addMod(MOD_INT,200);
        player:addMod(MOD_MND,200);
        player:addMod(MOD_CHR,200);
        player:addMod(MOD_ATT,1000);
		player:addMod(MOD_DEF,6500);
		player:addMod(MOD_ACC,2500);
		player:addMod(MOD_ACC,2500);
		player:addStatusEffect(EFFECT_MAGIC_ATK_BOOST,100,1,0);
	

end