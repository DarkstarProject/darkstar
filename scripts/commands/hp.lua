---------------------------------------------------------------------------------------------------
-- func: hp
-- auth: <Unknown>
-- desc: Sets the players health.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
};

function onTrigger(player, hp)
    if (hp == nil) then
        player:PrintToPlayer("You must enter a valid amount.");
        return;
    end
    
    if (player:getHP() > 0) then
        player:setHP(hp);
    end
end