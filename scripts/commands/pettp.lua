---------------------------------------------------------------------------------------------------
-- func: pettp
-- desc: Sets the players pet tp.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
};

function onTrigger(player, tp)
    if (player:getPet() == nil or tp == nil) then
        return;
    end

    player:getPet():addTP( tp );
end