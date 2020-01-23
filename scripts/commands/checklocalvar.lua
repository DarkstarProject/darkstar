---------------------------------------------------------------------------------------------------
-- func: checklocalvar <varName> <player/mob/npc> <ID>
-- desc: checks player or npc local variable and returns result value.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "sss"
};

function error(player, msg)
    player:PrintToPlayer(msg);
    player:PrintToPlayer("!checklocalvar <variable name> optional <player/mob/npc> optional <ID>");
end;

function onTrigger(player, arg1, arg2, arg3)
    local zone = player:getZoneID()
    local varName = arg1
    local entity = arg2
    local targ = arg3

    if (arg2 == nil) then
        targ = player:getCursorTarget()
        if targ == nil then
            error(player, "no target")
            return
        end
    end

    if (varName == nil) then
        error(player, "You must provide a variable name.");
        return;
    end

    if arg2 ~= nil and arg3 == nil then
        error(player, "no ID given for target")
        return
    end

    if zone == 55 or zone == 56 or zone == 60 or zone == 63 or zone == 66 or zone == 69 or (zone >= 73 and zone<= 77) then
        local instance = player:getInstance()
        if entity == 'npc' then
            targ = instance:getEntity(bit.band(arg3, 0xFFF), dsp.objType.NPC)
        elseif entity == 'mob' then
            targ = instance:getEntity(bit.band(arg3, 0xFFF), dsp.objType.MOB)
        elseif entity == 'player' then
            targ = GetPlayerByName(arg3)
        end
        if targ == nil then
            error(player, "Target is invalid")
            return
        end
        player:PrintToPlayer(string.format("%s's variable '%s' : %i", targ:getName(), varName, targ:getLocalVar(varName)));
    else
        if entity == 'npc' then
            targ = GetNPCByID(arg3)
        elseif entity == 'mob' then
            targ = GetMobByID(arg3)
        elseif entity == 'player' then
            targ = GetPlayerByName(arg3)
        end
        if targ == nil then
            error(player, "Target is invalid")
            return
        end

        player:PrintToPlayer(string.format("%s's variable '%s' : %i", targ:getName(), varName, targ:getLocalVar(varName)));
    end
end 