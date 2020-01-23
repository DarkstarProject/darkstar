---------------------------------------------------------------------------------------------------
-- func: setlocalvar <varName> <player/mob/npc> <ID>
-- desc: set player npc or mob local variable and value.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 3,
    parameters = "siss"
};

function error(player, msg)
    player:PrintToPlayer(msg);
    player:PrintToPlayer("!setlocalvar <variable name> <variable number> optional <player/mob/npc> <name>");
end;

function onTrigger(player, arg1, arg2, arg3, arg4)
    local zone = player:getZoneID()
    local varName = arg1
    local varNumber = arg2
    local entity = arg3
    local Name = arg4

    if entity == nil then
        targ = player:getCursorTarget()
        printf("%s", targ)
        if targ == nil then
            error(player, "no target")
            return
        end
    end

    if varName == nil then
        error(player, "You must provide a variable name.");
        return;
    end

    if varNumber == nil then
        error(player, "no varaiable number given for target")
        return
    end

    if Name == nil and targ == nil then
        error(player, "need to name a target")
        return
    end

    if zone == 55 or zone == 56 or zone == 60 or zone == 63 or zone == 66 or zone == 69 or (zone >= 73 and zone<= 77) then
        local instance = player:getInstance()
        if entity == 'npc' then
            targ = instance:getEntity(bit.band(Name, 0xFFF), dsp.objType.NPC)
        elseif entity == 'mob' then
            targ = instance:getEntity(bit.band(Name, 0xFFF), dsp.objType.MOB)
        elseif entity == 'player' then
            targ = GetPlayerByName(Name)
        end
        if targ == nil then
            error(player, "Target is invalid")
            return
        end
        targ:setLocalVar(varName, varNumber)
        player:PrintToPlayer(string.format("%s's variable '%s' : %i", targ:getName(), varName, varNumber));
    else
    printf("%s", targ)
        if entity == 'npc' then
            targ = GetNPCByID(Name)
        elseif entity == 'mob' then
            targ = GetMobByID(Name)
        elseif entity == 'player' then
            targ = GetPlayerByName(Name)
        end
        if targ == nil then
            error(player, "Target is invalid")
            return
        end
        targ:setLocalVar(varName, varNumber)
        player:PrintToPlayer(string.format("%s's variable '%s' : %i", targ:getName(), varName, varNumber));
    end
end
