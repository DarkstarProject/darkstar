---------------------------------------------------------------------------------------------------
-- func: removekeyitem
-- desc: Removes a keyitem from the target.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "si"
};

function onTrigger(player, target, keyId)
    -- Load needed text ids for players current zone..
    local TextIDs = "scripts/zones/" .. player:getZoneName() .. "/TextIDs";
    package.loaded[TextIDs] = nil;
    require(TextIDs); 

    if (keyId == nil) then
        player:PrintToPlayer("You must enter a valid keyitem id.");
        return;
    end
    
    if (target == nil) then
        target = player:getName();
    end

    local targ = GetPlayerByName( target );
    if (targ ~= nil) then
        targ:delKeyItem(keyId);
        targ:messageSpecial(KEYITEM_OBTAINED + 1, keyId);
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
    end
end