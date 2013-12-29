---------------------------------------------------------------------------------------------------
-- func: giveitem
-- auth: Link :: Modded by atom0s.
-- desc: Gives an item to the target player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "sii"
};

function onTrigger(player, target, itemId, amount)
    if (target == nil or itemId == nil) then
        player:PrintToPlayer("You must enter a valid player name and item id.");
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
    
    -- Attempt to give the target the item..
    if (targ:getFreeSlotsCount() == 0) then
        player:PrintToPlayer( string.format( "Player '%s' does not have free space for that item!", target ) );
    else
        targ:addItem( itemId, amount );
        targ:messageSpecial( ITEM_OBTAINED, itemId );
    end
end