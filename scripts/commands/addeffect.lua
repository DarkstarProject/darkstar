-----------------------------------
--  [Command name]: give effect to yourself or target
--  [Author      ]: Lautan
--  [Description ]: will give effect to player
--
-- @addeffect [target = yourself], effect id, power = 1, duration = 60
--
-- Examples:
--  (@addeffect Lautan 10) will give stun for 60 seconds
--  (@addeffect 3 5 40) will give poison to yourself for 40 seconds 5 hp a tick
--
-- scripts/globals/status.lua for effect ids
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,target,id, power, duration)

    if(target == nil) then
        printf("target nil")
        return;
    end

    local effectTarget = player;
    -- check if target name was entered
    local num = tonumber(target)
    if(type(num) == "number") then
        if(power == 0 or power == nil) then
            duration = 60
        else
            duration = power
        end

        if(id == 0 or id == nil) then
            power = 1
        else
            power = id
        end

        id = num
    else
        local pc = GetPlayerByName(target);
        if(pc ~= nil) then
            effectTarget = pc;
        else
            return;
        end

        if(power == 0 or power == nil) then
            power = 1
        end

        if(duration == 0 or duration == nil) then
            duration = 60
        end

        if(id == 0 or id == nil) then
            id = 1
        end

    end

    if(id == nil) then
        printf("addeffect: id is nil");
        return;
    end

    if(effectTarget:addStatusEffect(id, power, 3, duration)) then
        effectTarget:messagePublic(280,effectTarget, id, id);
    else
        effectTarget:messagePublic(283, effectTarget, id);
    end

end;