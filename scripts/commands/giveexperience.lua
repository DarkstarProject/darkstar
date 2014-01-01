---------------------------------------------------------------------------------------------------
-- func: giveexperience
-- auth: atom0s
-- desc: Gives the target player experience points.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "si"
};

function onTrigger(player, target, amount)

print( 'Exp amount: ' .. tostring( amount ) );

    if (target == nil or amount == nil) then
        player:PrintToPlayer("You must enter a valid player name and amount.");
        return;
    end

    local targ = GetPlayerByName( target );
    if (targ ~= nil) then
        targ:addExp( amount );
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
    end
end