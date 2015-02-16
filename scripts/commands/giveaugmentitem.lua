---------------------------------------------------------------------------------------------------
-- func: giveaugmentitem
-- auth: Link :: Modded by Boom.
-- desc: Gives an item to the target player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 2,
    parameters = "siiiiiiiiii"
};

function onTrigger(player, target, itemId, quantity, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val)

   local TextIDs = "scripts/zones/" .. player:getZoneName() .. "/TextIDs";
    package.loaded[TextIDs] = nil;
    require(TextIDs);

	if (target == nil or itemId == nil or tonumber(itemId) == nil or tonumber(itemId) == 0) then
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
        targ:addItem( itemId, quantity, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val );
        targ:messageSpecial( ITEM_OBTAINED, itemId );
    end
end
