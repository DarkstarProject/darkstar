---------------------------------------------------------------------------------------------------
-- func: @tp <amount> <player>
-- desc: Sets a players tp.
-- current known issue: pet tp fails to be set
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "is"
};

function onTrigger(player, tp, target)
    if (tp == nil) then
        player:PrintToPlayer("You must enter a valid amount.");
        player:PrintToPlayer( "@tp <amount> <player>" );
        return;
    end

    if (target == nil) then
        player:setTP( tp );
        local pet = player:getPet();
        if (pet ~= nil) then
            pet:setTP( tp );
        end
    else
        local targ = GetPlayerByName(target);
        if (targ ~= nil) then
            targ:setTP( tp );
            local pet = targ:getPet();
            if (pet ~= nil) then
                pet:setTP( tp );
            end
        else
            player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
            player:PrintToPlayer( "@tp <amount> <player>" );
        end
    end
end;