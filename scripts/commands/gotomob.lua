---------------------------------------------------------------------------------------------------
-- func: gotomob
-- desc: Goes to the target mob.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
};

function onTrigger(player, target)
if (player:getVar("inJail") ~= 0) then
        player:PrintToPlayer( string.format( "You've been bad, (Probably). Please contact a GM in game or on Slack for help." ) );
else
    if (target == nil) then
        player:PrintToPlayer("You must enter a valid mobID.");
        return;
    end

    local targ = GetMobByID( target );
    if (targ:getVar("inJail") ~= 0) then
        player:PrintToPlayer( string.format( "You've been bad, (Probably). Please contact a GM in game or on Slack for help." ) );
    elseif (targ ~= nil) then
        player:setPos( targ:getXPos(), targ:getYPos(), targ:getZPos(), 0, targ:getZoneID() );    
    else
        player:PrintToPlayer( string.format( "Mob named '%s' not found!", target ) );
        end
    end
end