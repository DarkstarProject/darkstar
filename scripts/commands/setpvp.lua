-----------------------------------
--  [Command name]: set pvp flag on target
--  [Author      ]: Lautan
--  [Description ]: will make a target attackable
--
--  (@setpvp Lautan 1) pvp on
--  (@setpvp Lautan 0) pvp off
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,target,value)

    local pc = GetPlayerByName(target);

    if (pc ~= nil) then
        -- pc:setPVPFlag(value);
    end
end;