---------------------------------------------------------------------------------------------------
-- func: RankTEST
-- auth: kernel
-- desc: 
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
};

    function onTrigger(player) 

        -- Add bonus mods to the player..
		player:player:setRank(10);

end