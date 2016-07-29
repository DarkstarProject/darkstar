---------------------------------------------------------------------------------------------------
-- func: addeffect
-- desc: Adds the given effect to the given player.
---------------------------------------------------------------------------------------------------

require("scripts/globals/status");

cmdprops =
{
    permission = 1,
    parameters = "si"
};

function onTrigger(player, target, id)

    -- Ensure a target is set..
    if (target == nil) then
        player:PrintToPlayer( "Target required; cannot be nil." );
        return;
    end

    local effectTarget = player;
    
    -- check if target name was entered
    local num = tonumber(target)
    if (type(num) == "number") then
        id = num
    else
        local pc = GetPlayerByName(target);
        if (pc ~= nil) then
            effectTarget = pc;
        else
            id = _G[target];
        end

        if (id == 0 or id == nil) then
            id = 1;
        end
    end

    if (id == nil) then
        player:PrintToPlayer( "Effect id cannot be nil." );
        return;
    end

    effectTarget:delStatusEffect(id)
end