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
        11798, 10000000, -- Twilight Helm
        11362, 10000000, -- Twilight Mail
        19132, 10000000, -- Twilight Dagger
        15959, 10000000, -- Twilight Belt
        11729, 10000000, -- Goading Belt
        11651, 7000000, -- Epona's Ring
        19129, 15000000, -- Rapidus Sax
        15428, 10000000, -- Ocelot Trousers
        14887, 10000000, -- Ocelot Gloves
        11622, 7000000, -- Agasaya's Collar
        18552, 15000000, -- Maleficus
        27510, 7000000, -- Fotia Gorget
        28419, 7000000, -- Hachirin-no-obi
    }

showShop(player, STATIC, stock);
end