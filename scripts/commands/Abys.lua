---------------------------------------------------------------------------------------------------
-- func: Abys Content Items
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player)
    player:PrintToPlayer("Welcome to BNET.cc's shop of Abys wares to aid you on your adventure!", 0xF);
stock = {
        11362, 10000000, -- Twilight Mail
		11363, 10000000, -- Twilight Cloak
		11625, 10000000, -- Twilight Torque
        11798, 10000000, -- Twilight Helm
        15959, 10000000, -- Twilight Belt
		16259, 10000000, -- Twilight Cape
		18551, 10000000, -- Twilight Scythe
        19132, 10000000, -- Twilight Knife
    }

showShop(player, STATIC, stock);
end