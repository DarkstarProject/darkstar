---------------------------------------------------------------------------------------------------
-- func: Shop for Whitegate Items
-- auth: <Unknown> :: Modded by Hiro
-- desc: Opens Shop for Whitegate Items
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player)
   
stock = {

 10474,500000, -- phorcys korazin
 10523,500000, -- phorcys mitts
 10554,500000, -- phorcys dirs
 10620,500000, -- phorcys schuhs
 10901,500000, -- phorcys salade
 10479,500000, -- thaumas coat
 10528,500000, -- thaumas gloves 
 10559,500000, -- thaumas kecks
 10625,500000, -- thaumas nails
 10906,500000, -- thaumas hat 
 10484,500000, -- nares saio
 10533,500000, -- nares cuffs
 10564,500000, -- nares trews
 10630,500000, -- nares clogs
 10911,500000, -- nares cap 

   } 
   
 
showShop(player, STATIC, stock);
end