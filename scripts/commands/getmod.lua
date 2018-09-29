---------------------------------------------------------------------------------------------------
-- func: getmod <modID>
-- desc: gets a mod by ID on the player or cursor target
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 3,
    parameters = "i"
};

function error(player, msg)
    player:PrintToPlayer(msg);
    player:PrintToPlayer("!getmod <modID>");
end;

function onTrigger(player, id)
    -- validate modID
    if (id == nil) then
        error(player, "Invalid modID.");
        return;
    end

    -- validate target
    local effectTarget = player:getCursorTarget();
    if (effectTarget == nil) then
        effectTarget = player;
    end

    player:PrintToPlayer(string.format("%s's Mod ID %i: %i", effectTarget:getName(), id, effectTarget:getMod(id)));
end;
