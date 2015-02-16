---------------------------------------------------------------------------------------------------
-- func: trialcomplete
-- auth: Omni
-- desc: debug to complete custom trial for testing
---------------------------------------------------------------------------------------------------
require("scripts/globals/common");
require("scripts/globals/status");
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 2,
    parameters = "iii"
};

function onTrigger(player,npc) 
	--[[ Add any variables needed to be complete for a trial here ]]--
	--relic
	player:setVar("Megalobugard_KILLS",4);
	player:setVar("Intulo_KILLS",4);
	player:setVar("Keeper_of_Halidom_KILLS",4);
	player:setVar("Dune_Widow_KILLS",3);
	player:setVar("Seww_the_Squidlimbed_KILLS",4);
	player:setVar("Mischievous_Micholas_KILLS",4);
	-------------------------------------------------
	player:setVar("Zareehkl_the_Jubilant_KILLS",5);
	player:setVar("Iriz_Irma_KILLS",5);
	player:setVar("Velionis_KILLS",5);
	player:setVar("Brass_Borer_KILLS",5);
	player:setVar("Dextrose_KILLS",5);
	player:setVar("Iriri_Samariri_KILLS",5);
	--------------------------------------------------
	
	
	
	
	--Delete me and add any more variables you need here.
	
	
	
	
	------------------------------------------------------
	player:setVar("TRIAL_COMPLETE",1); -- Leave this here.
	------------------------------------------------------
end

