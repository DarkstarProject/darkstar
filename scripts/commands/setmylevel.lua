---------------------------------------------------------------------------------------------------
-- func: setmylevel
-- desc: Sets the players current job level
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 5,
    parameters = "i"
};

function onTrigger(player, level)

    if (level == nil or level < 1 or level > 99) then
        player:PrintToPlayer("You must enter a valid level between 1 and 99.");
        return;
    end

        player:PrintToPlayer(string.format("Current level set to %i.", level));
        player:setLevel( level );
end