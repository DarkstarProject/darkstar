---------------------------------------------------------------------------------------------------
-- func: Shop for Mythic weapons
-- auth: <Unknown> :: Modded by Wadski
-- desc: Opens Shop for Mythic weapons
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player)
   
stock = {
18492,1000000, -- sturdy axe
18753,1000000, -- burning fists
18851,1000000, -- werebuster
18589,1000000, -- mage's staff
17742,1000000, -- vorpal sword
18003,1000000, -- swordbreaker
17744,1000000, -- brave blade
18944,1000000, -- death sickle
17956,1000000, -- double axe
18034,1000000, -- dancing dagger
18719,1000000, -- killer bow
18443,1000000, -- windslicer
18426,1000000, -- sasuke katana
18120,1000000, -- radiant lance
18590,1000000, -- scepter staff
17743,1000000, -- wightslayer
18720,1000000, -- quicksilver
18754,1000000, -- inferno claws
19102,1000000, -- main gauche
18592,1000000, -- elder staff


   }
 
showShop(player, STATIC, stock);
end