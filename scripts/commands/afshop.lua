---------------------------------------------------------------------------------------------------
-- func: Multi Job AF Shop
-- auth: <Unknown> :: Modded by Tagban/Cretal
-- desc: Opens Shop for Job Specific Equipment.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};


function onTrigger(player)
  
  switch(player:getMainJob()) : caseof
 {
   --WAR
  [0x01]= function (x)
  stock = {
    
    16678,20000, --Weapon
    12511,20000, --Head
    12638,20000, --Body
    13961,20000, --Hands
    14214,20000, --Legs
    14089,20000, --Feet
        
   }
   end,
   
   --MNK
  [0x02]= function (x)
  stock = {
    
    17478,20000, --Weapon
    12512,20000, --Head
    12639,20000, --Body
    13962,20000, --Hands
    14215,20000, --Legs
    14090,20000, --Feet
        
   }
   end,
    
   --WHM
  [0x03]= function (x)
  stock = {
    
    17422,20000, --Weapon
    13855,20000, --Head
    12640,20000, --Body
    13963,20000, --Hands
    14216,20000, --Legs
    14091,20000, --Feet
        
   }
   end,
      
   --BLM
  [0x04]= function (x)
  stock = {
    
    17423,20000, --Weapon
    13856,20000, --Head
    12641,20000, --Body
    13964,20000, --Hands
    14217,20000, --Legs
    14092,20000, --Feet
        
   }
   end,
      
   --RDM
  [0x05]= function (x)
  stock = {
    
    16829,20000, --Weapon
    12513,20000, --Head
    12642,20000, --Body
    13965,20000, --Hands
    14218,20000, --Legs
    14093,20000, --Feet
        
   }
   end,
      
   --THF
  [0x06]= function (x)
  stock = {
    
    16764,20000, --Weapon
    12514,20000, --Head
    12643,20000, --Body
    13966,20000, --Hands
    14219,20000, --Legs
    14094,20000, --Feet
        
   }
   end,
      
   --PLD
  [0x07]= function (x)
  stock = {
    
    17643,20000, --Weapon
    12515,20000, --Head
    12644,20000, --Body
    13967,20000, --Hands
    14220,20000, --Legs
    14095,20000, --Feet
        
   }
   end,
      
   --DRK
  [0x08]= function (x)
  stock = {
    
    16798,20000, --Weapon
    12516,20000, --Head
    12645,20000, --Body
    13968,20000, --Hands
    14221,20000, --Legs
    14096,20000, --Feet
        
   }
   end,
      
   --BST
  [0x09]= function (x)
  stock = {
    
    16680,20000, --Weapon
    12517,20000, --Head
    12646,20000, --Body
    13969,20000, --Hands
    14222,20000, --Legs
    14097,20000, --Feet
        
   }
   end,
      
   --BRD
  [0xA]= function (x)
  stock = {
    
    16680,20000, --Weapon
    12517,20000, --Head
    12646,20000, --Body
    13969,20000, --Hands
    14222,20000, --Legs
    14097,20000, --Feet
        
   }
   end,
      
   --RNG
  [0xB]= function (x)
  stock = {
    
    17188,20000, --Weapon
    12518,20000, --Head
    12648,20000, --Body
    13971,20000, --Hands
    14224,20000, --Legs
    14099,20000, --Feet
        
   }
   end,
      
   --SAM
  [0xC]= function (x)
  stock = {
    
    17812,20000, --Weapon
    13868,20000, --Head
    13781,20000, --Body
    13972,20000, --Hands
    14225,20000, --Legs
    14100,20000, --Feet
        
   }
   end,
      
   --NIN
  [0xD]= function (x)
  stock = {
    
    17771,20000, --Weapon
    17772,20000, --Weapon
    13869,20000, --Head
    13782,20000, --Body
    13973,20000, --Hands
    14226,20000, --Legs
    14101,20000, --Feet
        
   }
   end,
      
   --DRG
  [0xE]= function (x)
  stock = {
    
    16887,20000, --Weapon
    12519,20000, --Head
    12649,20000, --Body
    13974,20000, --Hands
    14227,20000, --Legs
    14102,20000, --Feet
        
   }
   end,

    --SMN
  [0xF]= function (x)
  stock = {
    
    17532,20000, --Weapon
    12520,20000, --Head
    12650,20000, --Body
    13975,20000, --Hands
    14228,20000, --Legs
    14103,20000, --Feet
        
   }
   end,    
 
    --BLU
  [0x10]= function (x)
  stock = {
    
    17717,20000, --Weapon
    15265,20000, --Head
    14521,20000, --Body
    14928,20000, --Hands
    15600,20000, --Legs
    15684,20000, --Feet
        
   }
   end, 
   
    --COR
  [0x11]= function (x)
  stock = {
    
    18702,20000, --Weapon
    15266,20000, --Head
    14522,20000, --Body
    14929,20000, --Hands
    15601,20000, --Legs
    15685,20000, --Feet
        
   }
   end, 
   
    --PUP
  [0x12]= function (x)
  stock = {
    
    17858,20000, --Weapon
    15267,20000, --Head
    14523,20000, --Body
    14930,20000, --Hands
    15602,20000, --Legs
    15686,20000, --Feet
        
   }
   end,   
   
      
    --DNC
  [0x13]= function (x)
  stock = {
    
    19203,20000, --Weapon
    16138,20000, --HeadM
    14578,20000, --BodyM
    15002,20000, --HandsM
    15659,20000, --LegsM
    15746,20000, --FeetM
    16139,20000, --HeadF
    14579,20000, --BodyF
    15003,20000, --HandsF
    15660,20000, --LegsF
    15747,20000, --FeetF
        
   }
   end, 
      
    --SCH
  [0x14]= function (x)
  stock = {
    
    6058,20000, --Weapon
    16140,20000, --Head
    14580,20000, --Body
    15004,20000, --Hands
    16311,20000, --Legs
    15748,20000, --Feet
        
   }
   end,
 }
 
  showShop(player, STATIC, stock);
end