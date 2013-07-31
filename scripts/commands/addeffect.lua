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
        return;
    end

    power = power or 1
    duration = duration or 60

    local effectTarget = player;
    -- check if target name was entered
    local num = tonumber(target)
    if(type(num) == "number") then
        id = target
    else
        local pc = GetPlayerByName(target);
        if(pc ~= nil) then
            effectTarget = pc;
        end
    end

    if(effectTarget:addStatusEffect(id, power, 3, duration)) then
        effectTarget:messageBasic(280,id,id);
    else
        effectTarget:messageBasic(283,id);
    end

end;