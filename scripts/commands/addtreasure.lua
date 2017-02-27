---------------------------------------------------------------------------------------------------
-- func: addtreasure <itemId> <target player/party/alliance>
-- desc: Adds an item directly to the treasure pool.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "isi"
};

function onTrigger(player, itemId, target, dropper)
    local targ;
    if (target == nil) then
        targ = player
    else
        targ = GetPlayerByName(target);
    end

    if (targ == nil) then
        player:PrintToPlayer(string.format("Player named '%s' not found!", target));
        return
    end

    if (itemId == nil or tonumber(itemId) == nil or tonumber(itemId) == 0) then
        player:PrintToPlayer("You must enter a valid item id.");
        return;
    end

    if (dropper ~= nil) then
        dropper = GetNPCByID(dropper);
    end

    targ:addTreasure(itemId, dropper);
    player:PrintToPlayer(string.format("Item of ID %d was added to the treasure pool of %s or their party/alliance.", itemId, targ:getName()));
end