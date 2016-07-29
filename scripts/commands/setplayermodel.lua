---------------------------------------------------------------------------------------------------
-- func: @setplayermodel <modelid> <slot> <player>
-- desc: Sets the look of the user or target player based on model id offset and slot (for testing).
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iis"
};

function onTrigger(player, model, slot, target)
    if (model == nil or slot == nil or model < 0 or slot < 0 or slot > 8) then
        player:PrintToPlayer("Usage: @setplayermodel modelid slot player");
        player:PrintToPlayer("Slots: 0=main 1=sub 2=ranged 3=ammo 4=head 5=body 6=hands 7=legs 8=feet");
        return;
    end

    if (target == nil) then
        player:setModelId(model, slot);
    else
        local targ = GetPlayerByName(target);
        if (targ ~= nil) then
            targ:setModelId(model, slot);
            player:PrintToPlayer(string.format("Set slot %i to model %i for player '%s'.", slot, model, target));
        else
            player:PrintToPlayer(string.format("Player named '%s' not found!", target));
        end
    end
end;