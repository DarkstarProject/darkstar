---------------------------------------------------------------------------------------------------
-- func: wallhack <optional target>
-- desc: Allows the player to walk through walls.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
};

function onTrigger(player, target)
    local targ;
    if (target == nil) then
        targ = player;
    else
        targ = GetPlayerByName(target);
    end

    if (targ == nil) then
        player:PrintToPlayer(string.format("Player named '%s' not found!", target));
        return;
    end

    if (targ:checkNameFlags(0x00000200)) then
        targ:setFlag(0x00000200);
        player:PrintToPlayer("Toggled wallhack flag OFF.");
    else
        targ:setFlag(0x00000200);
        player:PrintToPlayer("Toggled wallhack flag ON.");
    end
end
