---------------------------------------------------------------------------------------------------
-- func: homepoint
-- auth: bluekirby0
-- desc: Sends the target to their homepoint.
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
        player:PrintToPlayer( string.format( "You've been bad." ) );
    elseif (targ ~= nil) then
        targ:warp();
        player:PrintToPlayer( string.format( "Welcome Home!!!" ) );
    end
end