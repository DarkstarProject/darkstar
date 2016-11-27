---------------------------------------------------------------------------------------------------
-- func: BNETcc Server Shop
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player)
    player:PrintToPlayer("Welcome to BNET.cc's pop shop of wares to aid you on your adventure!", 0xF);
stock = {
        3341, 1000000, -- Beastly Shank
        3342, 5000000, -- Savory Shank 
        3339, 1000000, -- Honey Wine
        3340, 5000000, -- Sweet Tea
        3343, 1000000, -- Blue Pondweed
        3344, 5000000, -- Red Pondweed
    }

showShop(player, STATIC, stock);
end