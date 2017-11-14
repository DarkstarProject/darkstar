---------------------------------------------------------------------------------------------------
-- func: Teleports player to Homepoint.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player, target)
        target = player:getName();
    local targ = GetPlayerByName( target );
    if (player:getVar("inJail") ~= 0) then
        player:PrintToPlayer( string.format( "You've been bad, (Probably). Please contact a GM in game or on Slack for help." ) );
    elseif (targ ~= nil) then
        targ:warp();
        player:PrintToPlayer( string.format( "Welcome Home!!!" ) );
    end
end