---------------------------------------------------------------------------------------------------
-- func: BNETcc Server Shop
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player)
    player:PrintToPlayer("Welcome to BNET.cc's shop of wares to aid you on your adventure!", 0xF);
stock = {
        -- 15793, 150000, -- Anniversary Ring
        -- 15761, 15000, -- Chariot Band
        15762, 15000, -- Empress Band
        15763, 35000, -- Emperor Band
        4182, 15000, -- Instant Reraise
        4165, 5000, -- Silent Oil
        4164, 5000, -- Prism Powder
        4151, 5000, -- Echo Drops
		1127, 10000, -- Kindred's Seal
        6307, 5000, -- Happo Shuriken +1 Pouch
        5410, 5000, -- Virtue Stone pouch
        4213, 5000, -- Icarus Wing
        4175, 5000, -- Vile Elixir +1
        5142, 5000, -- Bison Steak
        4381, 5000, -- Meat Mithkabob
        5146, 5000, -- Hedgehog Pie
        5162, 5000, -- Squid Sushi +1
        5163, 5000, -- Sole Sushi +1
        5174, 5000, -- Tavnazian Taco
        5759, 5000, -- Red Curry Bun
        5781, 5000, -- Kitron Macaron
        5718, 5000, -- Cream Puff
        4558, 5000, -- Yagudo Drink
        4511, 5000, -- Ambrosia
        4284, 5000, -- Tender Navarin
        4549, 5000, -- Dragon Soup
        5603, 5000, -- Hydra Kofte +1
        5925, 5000, -- Charred Salisbury Steak
		1126, 5000, -- Beastmen's Seal
		1550, 500000, -- Ark pentasphere
		1875, 50000, -- Ancient beastcoin 
        1298, 5000000, -- Hakutaku eye cluster
    }

showShop(player, STATIC, stock);
end