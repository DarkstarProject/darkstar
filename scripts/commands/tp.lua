---------------------------------------------------------------------------------------------------
-- func: tp
-- auth: <Unknown>
-- desc: Sets a players tp.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
};

function onTrigger(player, tp)
    if (tp == nil) then
        player:PrintToPlayer("You must enter a valid amount.");
        return;
    end
    
    player:setTP( tp );
    
    local pet = player:getPet();
    if (pet ~= nil) then
        pet:setTP( tp );
    end
end