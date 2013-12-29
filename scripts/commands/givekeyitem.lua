---------------------------------------------------------------------------------------------------
-- func: givekeyitem
-- auth: Link :: Modded by atom0s.
-- desc: Gives a key item to the target player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "si"
};

function onTrigger(player, target, keyId)
    if (target == nil or keyId == nil) then
        player:PrintToPlayer("You must enter a valid player name and keyitem id.");
        return;
    end
    
    local targ = GetPlayerByName( target );
    if (targ == nil) then
        player:PrintToPlayer( string.format( "Invalid player '%s' given.", target ) );
        return;
    end

    -- Load needed text ids for players current zone..
    local TextIDs = "scripts/zones/" .. player:getZoneName() .. "/TextIDs";
    package.loaded[TextIDs] = nil;
    require(TextIDs); 
    
    -- Give the key item to the target..
    targ:addKeyItem( keyId );
    targ:messageSpecial( KEYITEM_OBTAINED, keyId );
end