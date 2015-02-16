---------------------------------------------------------------------------------------------------
-- func: godmode
-- auth: bluekirby0 :: Modded by atom0s. (Thanks to Mishima for more buff ideas.)
-- desc: Toggles god mode on the player; granting them several special abilities.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
};

function onTrigger(player)
--[[

Can't do mods outside of effects in this manner 
(foods are their own effects so they get away with it by magic)

	if (player:getVar("FastCast") == 0) then
        -- Toggle  on..
        player:setVar("FastCast", 1);
		player:addMod(MOD_FASTCAST,700);
		player:addStatusEffect(EFFECT_REFRESH,99,0,0);
		 player:addStatusEffect(EFFECT_REGEN,99,0,0);
		 player:addMod(MOD_GRIMOIRE_SPELLCASTING,700);

	else
	 -- Toggle  off..
        player:setVar("FastCast", 0);
		--player:delMod(MOD_FASTCAST,700);
		player:delStatusEffect(EFFECT_REFRESH);
		player:delStatusEffect(EFFECT_REGEN);
		--player:delMod(MOD_GRIMOIRE_SPELLCASTING,700);
	end
]]--
end
