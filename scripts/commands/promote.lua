---------------------------------------------------------------------------------------------------
-- func: promote
-- desc: Promotes the player to a new GM level.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "si"
};

function onTrigger(player, target, level)
    if (level == nil) then
        level = target;
        target = player:getName();
    end

    if (target == nil) then
        target = player:getName();
    end

    -- Validate the target..
    local targ = GetPlayerByName( target );
    if (targ == nil) then
        player:PrintToPlayer( string.format( "Invalid player '%s' given.", target ) );
        return;
    end

    -- Validate the level..
    if (level < 0) then 
        level = 0;
    end

    if (targ:getGMLevel() < player:getGMLevel()) then
        if (level < player:getGMLevel()) then
            targ:setGMLevel(level);
        else
            player:PrintToPlayer( "Target's new level is too high." );
        end
    else
        printf( "%s attempting to adjust higher GM: %s", player:getName(), targ:getName() );
    end
end;