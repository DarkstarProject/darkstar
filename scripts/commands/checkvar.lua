---------------------------------------------------------------------------------------------------
-- func: checkvar <varType> <varName>
-- desc: checks player or server variable and returns result value.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "ss"
};

function onTrigger(player, varType, varName)
    if (varType == nil or varName == nil) then
        player:PrintToPlayer("Incorrect command syntax or missing paramters.");
        player:PrintToPlayer("@checkvar <player name or server> <variable name>");
        return;
    end

    if (varType == "server") then
        player:PrintToPlayer(string.format("Server Variable '%s' : %u ", varName, GetServerVariable(varName)));
    else
        local targ = GetPlayerByName(varType);
        if (targ ~= nil) then
            player:PrintToPlayer(string.format("Player '%s' variable '%s' : %u ", varType, varName, targ:getVar(varName)));
        else
            player:PrintToPlayer(string.format( "Player named '%s' not found!", varType));
        end
    end
end