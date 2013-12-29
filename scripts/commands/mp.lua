---------------------------------------------------------------------------------------------------
-- func: mp
-- auth: <Unknown>
-- desc: Sets the players mana.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
};

function onTrigger(player, mp)
    if (mp == nil) then
        player:PrintToPlayer("You must enter a valid amount.");
        return;
    end
    player:setMP( mp );
end