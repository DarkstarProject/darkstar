---------------------------------------------------------------------------------------------------
-- func: setplayerrank
-- auth: Imaulle
-- desc: Sets the target players rank.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "si"
};

function onTrigger(player, target, rank)
    if (target == nil) then
        target = player:getName();
    end

    if (rank > 10 or rank < 1) then
        player:PrintToPlayer( "Invalid rank! Must be between 1 and 10!" );
        return;
    end

    local targ = GetPlayerByName( target );
    if (targ ~= nil) then
        targ:setRank( rank );
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
    end
end
