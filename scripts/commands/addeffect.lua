---------------------------------------------------------------------------------------------------
-- func: addeffect
-- desc: Adds the given effect to the given player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "siii"
};

function onTrigger(player, target, id, power, duration)

    -- Ensure a target is set..
    if (target == nil) then
        player:PrintToPlayer( "Target required; cannot be nil." );
        return;
    end

    local effectTarget = player;
    
    -- check if target name was entered
    local num = tonumber(target)
    if (type(num) == "number") then
        if (power == 0 or power == nil) then
            duration = 60;
        else
            duration = power;
        end

        if (id == 0 or id == nil) then
            power = 1;
        else
            power = id;
        end

        id = num
    else
        local pc = GetPlayerByName(target);
        if (pc ~= nil) then
            effectTarget = pc;
        else
            return;
        end

        if (power == nil) then
            power = 1;
        end

        if (duration == nil) then
            duration = 60;
        end

        if (id == 0 or id == nil) then
            id = 1;
        end
    end

    if (id == nil) then
        player:PrintToPlayer( "Effect id cannot be nil." );
        return;
    end

    if (effectTarget:addStatusEffect(id, power, 3, duration)) then
        effectTarget:messagePublic(280, effectTarget, id, id);
    else
        effectTarget:messagePublic(283, effectTarget, id);
    end
end