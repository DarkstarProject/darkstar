---------------------------------------------------------------------------------------------------
-- func: title
-- desc: Sets a players title.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "is"
};

function onTrigger(player, titleId, target)
    if (titleId == nil) then
        player:PrintToPlayer("You must enter a valid title id.");
        return
    end

    if (target == nil) then
        target = player:getName();
    end

    local targ = GetPlayerByName(target);
    if (targ ~= nil) then
        targ:addTitle( titleId );
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
    end
end