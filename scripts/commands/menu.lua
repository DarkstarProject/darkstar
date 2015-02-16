---------------------------------------------------------------------------------------------------
-- func: menu test
-- auth: <Unknown>
-- desc: Sets the players shop.
---------------------------------------------------------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/conquest");



cmdprops =
{
    permission = 1,
    parameters = "i"
};

function onTrigger(player)
    player:sendMenu(3);
end;
