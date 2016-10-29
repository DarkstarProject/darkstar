---------------------------------------------------------------------------------------------------
-- func: exec
-- desc: Allows you to execute a Lua string directly from chat.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 4,
    parameters = "s"
};

function onTrigger(player, str)
    -- Ensure a command was given..
    if (str == nil or string.len(str) == 0) then
        player:PrintToPlayer("You must enter a string to execute.");
        return;
    end
    
    -- For safety measures we will nuke the os table..
    local old_os = os;
    os = nil;
    
    -- Ensure the command compiles / is valid..
    local scriptObj, err = loadstring(str);
    if (scriptObj == nil) then
        player:PrintToPlayer("Failed to load the given string.");
        player:PrintToPlayer(err);
        os = old_os;
        return;
    end
    
    -- Execute the string..
    local status, err = pcall(scriptObj);
    if (status == false) then
        player:PrintToPlayer(err);
    end
    
    -- Restore the os table..
    os = old_os;
end