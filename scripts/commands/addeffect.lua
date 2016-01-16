---------------------------------------------------------------------------------------------------
-- func: addeffect
-- desc: Adds the given effect to the given player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "siiiii"
};

function onTrigger(player, target, id, power, duration, subid, subPower)

    -- Ensure a target is set..
    if (target == nil) then
        player:PrintToPlayer( "Target required; cannot be nil." );
        return;
    end

    local effectTarget = player;
    
    -- check if target name was entered
    local num = tonumber(target)
    if (type(num) == "number") then
        if (subid == 0 or subid == nil) then
            subPower = 0;
        else
            subPower = subid;
        end

        if (duration == 0 or duration == nil) then
            subid = 0;
        else
            subid = duration;
        end

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

        if (subid == nil) then
            subid = 0;
        end

        if (subPower == nil) then
            subPower = 0;
        end

        if (id == 0 or id == nil) then
            id = 1;
        end
    end

    if (id == nil) then
        player:PrintToPlayer( "Effect id cannot be nil." );
        return;
    end

    if (effectTarget:addStatusEffect(id, power, 3, duration, subid, subPower)) then
        effectTarget:messagePublic(280, effectTarget, id, id);
    else
        effectTarget:messagePublic(283, effectTarget, id);
    end
end