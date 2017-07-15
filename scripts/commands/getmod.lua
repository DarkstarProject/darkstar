---------------------------------------------------------------------------------------------------
-- func: getmod
-- desc: gets a mod on the target/player
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 3,
    parameters = "is"
};

function onTrigger(player, id, target)
    local effectTarget = player;
    if (target ~= nil) then
        effectTarget = target;
    end

    if (id == nil) then
        player:PrintToPlayer( "Mod id cannot be nil." );
        return;
    end

    player:PrintToPlayer(string.format("Mod %i: %i", id, effectTarget:getMod(id)));
end